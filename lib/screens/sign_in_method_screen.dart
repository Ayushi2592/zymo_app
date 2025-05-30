import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'payment_screen.dart';

class SignInMethodScreen extends StatefulWidget {
  final double amount;
  final int requiredAmount;
  
  const SignInMethodScreen({
    Key? key,
    required this.amount,
    required this.requiredAmount,
  }) : super(key: key);

  @override
  State<SignInMethodScreen> createState() => _SignInMethodScreenState();
}

class _SignInMethodScreenState extends State<SignInMethodScreen> {
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  Future<void> _handleGoogleSignIn() async {
    if (_isLoading) return; // Prevent double taps

    setState(() {
      _isLoading = true;
    });

    try {
      print('Initiating Google Sign In...');
      final UserCredential? userCredential = await _authService.signInWithGoogle();
      
      if (!mounted) return;

      if (userCredential?.user != null) {
        print('Successfully signed in: ${userCredential?.user?.email}');
        // Show success message before navigation
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Successfully signed in!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1),
          ),
        );

        // Navigate after a brief delay to show the success message
        await Future.delayed(const Duration(milliseconds: 1000));
        if (!mounted) return;
        
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => PaymentScreen(amount: widget.amount),
          ),
          (route) => false,
        );
      } else {
        if (!mounted) return;
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign in was cancelled'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (e) {
      print('Error during sign in: $e');
      if (!mounted) return;

      String errorMessage = 'Failed to sign in with Google';
      if (e.toString().contains('network')) {
        errorMessage = 'Network error. Please check your internet connection.';
      } else if (e.toString().contains('popup_closed')) {
        errorMessage = 'Sign in cancelled by user';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Container(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/zymo_logo.jpeg',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'ZYMO',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Sign in to continue',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            // Sign in with Email button
            _buildSignInButton(
              icon: Icons.email_outlined,
              text: 'Sign in with Email',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              backgroundColor: Colors.grey[50]!,
              textColor: Colors.black87,
              iconColor: Colors.grey[600]!,
              hasBorder: true,
            ),

            const SizedBox(height: 16),

            // Sign in with Google button
            _buildSignInButton(
              icon: Icons.g_mobiledata,
              text: _isLoading ? 'Signing in...' : 'Sign in with Google',
              onTap: _isLoading ? null : _handleGoogleSignIn,
              backgroundColor: Colors.white,
              textColor: Colors.black87,
              iconColor: Colors.grey[600]!,
              hasBorder: true,
              isLoading: _isLoading,
            ),

            const SizedBox(height: 16),

            // Sign in with Apple button
            _buildSignInButton(
              icon: Icons.apple,
              text: 'Sign in with Apple',
              onTap: () {
                // Handle Apple sign in
                print('Apple sign in tapped');
              },
              backgroundColor: Colors.white,
              textColor: Colors.black87,
              iconColor: Colors.grey[600]!,
              hasBorder: true,
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Text(
                'By continuing, you agree to our Terms of Service and Privacy Policy',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInButton({
    required IconData icon,
    required String text,
    required VoidCallback? onTap,
    required Color backgroundColor,
    required Color textColor,
    required Color iconColor,
    bool hasBorder = false,
    bool isLoading = false,
  }) {
    return Container(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFFFA8D),
          elevation: hasBorder ? 0 : 2,
          shadowColor: Colors.grey.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: hasBorder
                ? BorderSide(color: Colors.grey[300]!, width: 1)
                : BorderSide.none,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            if (isLoading)
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(iconColor),
                ),
              )
            else
              Icon(
                icon,
                size: 24,
                color: iconColor,
              ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 40), // Balance the icon space
          ],
        ),
      ),
    );
  }
}
