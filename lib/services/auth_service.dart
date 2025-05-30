import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      print('Starting Google Sign In flow...');

      await _googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        print('Google Sign In cancelled by user');
        return null;
      }

      print('Google Sign In successful for user: ${googleUser.email}');

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      print(
          'Access Token: ${googleAuth.accessToken != null ? 'Present' : 'Missing'}');
      print('ID Token: ${googleAuth.idToken != null ? 'Present' : 'Missing'}');

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw Exception('Failed to obtain Google auth tokens');
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      print('Signing in to Firebase...');

      try {
        final userCredential = await _auth.signInWithCredential(credential);

        if (userCredential.user != null) {
          print(
              'Successfully signed in to Firebase: ${userCredential.user?.email}');
          return userCredential;
        } else {
          print('Firebase sign in failed - no user returned');
          return null;
        }
      } on FirebaseAuthException catch (e) {
        print('FirebaseAuthException: ${e.code} - ${e.message}');

        switch (e.code) {
          case 'account-exists-with-different-credential':
            throw Exception('Account exists with different credentials');
          case 'invalid-credential':
            throw Exception('Invalid credentials provided');
          case 'operation-not-allowed':
            throw Exception('Google sign-in is not enabled');
          case 'user-disabled':
            throw Exception('User account has been disabled');
          default:
            throw Exception('Authentication failed: ${e.message}');
        }
      } catch (e) {
        print('Firebase signInWithCredential error: $e');

        if (e.toString().contains('PigeonUserDetails')) {
          throw Exception(
              'Authentication plugin compatibility issue. Please update your app.');
        }
        rethrow;
      }
    } catch (e, stackTrace) {
      print('Error in signInWithGoogle: $e');
      print('Stack trace: $stackTrace');

      try {
        await _googleSignIn.signOut();
      } catch (cleanupError) {
        print('Error during cleanup: $cleanupError');
      }

      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await Future.wait([
        _auth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (e) {
      print('Error signing out: $e');
      rethrow;
    }
  }
}
