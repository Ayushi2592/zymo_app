// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';

// // class RegistrationScreen extends StatefulWidget {
// //   const RegistrationScreen({Key? key}) : super(key: key);

// //   @override
// //   _RegistrationScreenState createState() => _RegistrationScreenState();
// // }

// // class _RegistrationScreenState extends State<RegistrationScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _nameController = TextEditingController();
// //   final _emailController = TextEditingController();
// //   final _passwordController = TextEditingController();
// //   final _confirmPasswordController = TextEditingController();
// //   bool _obscurePassword = true;
// //   bool _obscureConfirmPassword = true;
// //   bool _isLoading = false;
// //   String? _errorMessage;

// //   @override
// //   void dispose() {
// //     _nameController.dispose();
// //     _emailController.dispose();
// //     _passwordController.dispose();
// //     _confirmPasswordController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       appBar: AppBar(
// //         backgroundColor: Colors.black,
// //         foregroundColor: Colors.white,
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(24.0),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               const SizedBox(height: 20),

// //               // Welcome Text
// //               const Text(
// //                 'Get Started!',
// //                 style: TextStyle(
// //                   fontSize: 26,
// //                   fontWeight: FontWeight.bold,
// //                   color: Color(0xFFFFFA8D),
// //                 ),
// //               ),
// //               const SizedBox(height: 8),
// //               Text(
// //                 'Create an account to continue',
// //                 style: TextStyle(
// //                   fontSize: 14,
// //                   color: Colors.grey[600],
// //                 ),
// //               ),

// //               const SizedBox(height: 32),

// //               TextFormField(
// //                 controller: _nameController,
// //                 style: const TextStyle(color: Colors.white),
// //                 decoration: InputDecoration(
// //                   labelText: 'Full Name',
// //                   hintText: 'Enter your full name',
// //                   hintStyle: TextStyle(color: Colors.white),
// //                   labelStyle: TextStyle(color: Colors.white),
// //                   prefixIcon: Icon(Icons.person_outline, color: Colors.white),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide(color: Colors.white),
// //                   ),
// //                   focusedBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide:
// //                         const BorderSide(color: Color(0xFFFFFA8D), width: 2),
// //                   ),
// //                 ),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please enter your name';
// //                   }
// //                   return null;
// //                 },
// //               ),

// //               const SizedBox(height: 16),

// //               // Email Field
// //               TextFormField(
// //                 controller: _emailController,
// //                 style: const TextStyle(color: Colors.white),
// //                 keyboardType: TextInputType.emailAddress,
// //                 decoration: InputDecoration(
// //                   labelText: 'Email',
// //                   hintText: 'Enter your email',
// //                   hintStyle: TextStyle(color: Colors.white),
// //                   labelStyle: TextStyle(color: Colors.white),
// //                   prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide(color: Colors.white),
// //                   ),
// //                   focusedBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide:
// //                         const BorderSide(color: Color(0xFFFFFA8D), width: 2),
// //                   ),
// //                 ),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please enter your email';
// //                   }
// //                   if (!value.contains('@')) {
// //                     return 'Please enter a valid email';
// //                   }
// //                   return null;
// //                 },
// //               ),

// //               const SizedBox(height: 16),

// //               // TextFormField(
// //               //   controller: _nameController,
// //               //   style: const TextStyle(color: Colors.white),
// //               //   decoration: InputDecoration(
// //               //     labelText: 'Mobile No.',
// //               //     hintText: 'Enter your mobile no.',
// //               //     hintStyle: TextStyle(color: Colors.white),
// //               //     labelStyle: TextStyle(color: Colors.white),
// //               //     prefixIcon: Icon(Icons.call, color: Colors.white),
// //               //     border: OutlineInputBorder(
// //               //       borderRadius: BorderRadius.circular(12),
// //               //     ),
// //               //     enabledBorder: OutlineInputBorder(
// //               //       borderRadius: BorderRadius.circular(12),
// //               //       borderSide: BorderSide(color: Colors.white),
// //               //     ),
// //               //     focusedBorder: OutlineInputBorder(
// //               //       borderRadius: BorderRadius.circular(12),
// //               //       borderSide:
// //               //           const BorderSide(color: Color(0xFFFFFA8D), width: 2),
// //               //     ),
// //               //   ),
// //               //   validator: (value) {
// //               //     if (value == null || value.isEmpty) {
// //               //       return 'Please enter your mobile no.';
// //               //     }
// //               //     return null;
// //               //   },
// //               // ),

// //               const SizedBox(height: 16),

// //               TextFormField(
// //                 controller: _passwordController,
// //                 style: const TextStyle(color: Colors.white),
// //                 obscureText: _obscurePassword,
// //                 decoration: InputDecoration(
// //                   labelText: 'Password',
// //                   hintText: 'Enter your password',
// //                   hintStyle: TextStyle(color: Colors.white),
// //                   labelStyle: TextStyle(color: Colors.white),
// //                   prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
// //                   suffixIcon: IconButton(
// //                     icon: Icon(
// //                       _obscurePassword
// //                           ? Icons.visibility_off
// //                           : Icons.visibility,
// //                       color: Colors.white,
// //                     ),
// //                     onPressed: () {
// //                       setState(() {
// //                         _obscurePassword = !_obscurePassword;
// //                       });
// //                     },
// //                   ),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide(color: Colors.white),
// //                   ),
// //                   focusedBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide:
// //                         const BorderSide(color: Color(0xFFFFFA8D), width: 2),
// //                   ),
// //                 ),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please enter your password';
// //                   }
// //                   if (value.length < 6) {
// //                     return 'Password must be at least 6 characters';
// //                   }
// //                   return null;
// //                 },
// //               ),

// //               const SizedBox(height: 16),

// //               // Confirm Password Field
// //               TextFormField(
// //                 controller: _confirmPasswordController,
// //                 style: const TextStyle(color: Colors.white),
// //                 obscureText: _obscureConfirmPassword,
// //                 decoration: InputDecoration(
// //                   labelText: 'Confirm Password',
// //                   hintText: 'Confirm your password',
// //                   hintStyle: TextStyle(color: Colors.white),
// //                   labelStyle: TextStyle(color: Colors.white),
// //                   prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
// //                   suffixIcon: IconButton(
// //                     icon: Icon(
// //                       _obscureConfirmPassword
// //                           ? Icons.visibility_off
// //                           : Icons.visibility,
// //                       color: Colors.white,
// //                     ),
// //                     onPressed: () {
// //                       setState(() {
// //                         _obscureConfirmPassword = !_obscureConfirmPassword;
// //                       });
// //                     },
// //                   ),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide(color: Colors.white),
// //                   ),
// //                   focusedBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide:
// //                         const BorderSide(color: Color(0xFFFFFA8D), width: 2),
// //                   ),
// //                 ),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please confirm your password';
// //                   }
// //                   if (value != _passwordController.text) {
// //                     return 'Passwords do not match';
// //                   }
// //                   return null;
// //                 },
// //               ),

// //               const SizedBox(height: 32),

// //               // Register Button
// //               SizedBox(
// //                 width: double.infinity,
// //                 height: 56,
// //                 child: ElevatedButton(
// //                   onPressed: () async {
// //                     if (_formKey.currentState!.validate()) {
// //                       setState(() {
// //                         _isLoading = true;
// //                         _errorMessage = null;
// //                       });
// //                       try {
// //                         await FirebaseAuth.instance.createUserWithEmailAndPassword(
// //                           email: _emailController.text.trim(),
// //                           password: _passwordController.text.trim(),
// //                         );
// //                         // Navigate to login or home screen on success
// //                         Navigator.pop(context);
// //                       } on FirebaseAuthException catch (e) {
// //                         setState(() {
// //                           _errorMessage = e.message;
// //                         });
// //                       } finally {
// //                         setState(() {
// //                           _isLoading = false;
// //                         });
// //                       }
// //                     }
// //                   },
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Color(0xFFFFFA8D),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                   ),
// //                   child: const Text(
// //                     'Create Account',
// //                     style: TextStyle(
// //                       fontSize: 16,
// //                       fontWeight: FontWeight.w600,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                 ),
// //               ),

// //               const SizedBox(height: 24),

// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Text(
// //                     'Already have an account?',
// //                     style: TextStyle(
// //                       color: Colors.grey[600],
// //                     ),
// //                   ),
// //                   TextButton(
// //                     onPressed: () {
// //                       Navigator.pop(context);
// //                     },
// //                     child: const Text(
// //                       'Sign In',
// //                       style: TextStyle(
// //                         color: Color(0xFFFFFA8D),
// //                         fontWeight: FontWeight.w600,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),

// //               if (_isLoading) ...[
// //                 const Center(child: CircularProgressIndicator()),
// //                 const SizedBox(height: 16),
// //               ],
// //               if (_errorMessage != null) ...[
// //                 Text(
// //                   _errorMessage!,
// //                   style: const TextStyle(color: Colors.red),
// //                 ),
// //                 const SizedBox(height: 16),
// //               ],
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'payment_screen.dart';

// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({Key? key}) : super(key: key);

//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;
//   bool _isLoading = false;
//   String? _errorMessage;

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   Future<void> _createAccount() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//         _errorMessage = null;
//       });

//       try {
//         // Create user account with Firebase
//         final credential =
//             await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim(),
//         );

//         // Update user profile with display name
//         if (credential.user != null) {
//           await credential.user!.updateDisplayName(_nameController.text.trim());

//           // Navigate to payment screen on successful registration
//           if (mounted) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const PaymentScreen(amount: 2784.00),
//               ),
//             );
//           }
//         }
//       } on FirebaseAuthException catch (e) {
//         setState(() {
//           switch (e.code) {
//             case 'weak-password':
//               _errorMessage = 'The password provided is too weak.';
//               break;
//             case 'email-already-in-use':
//               _errorMessage = 'An account already exists for this email.';
//               break;
//             case 'invalid-email':
//               _errorMessage = 'The email address is badly formatted.';
//               break;
//             case 'operation-not-allowed':
//               _errorMessage = 'Email/password accounts are not enabled.';
//               break;
//             default:
//               _errorMessage =
//                   e.message ?? 'An error occurred during registration.';
//           }
//         });
//         print('Firebase Auth Error: ${e.code} - ${e.message}');
//       } catch (e) {
//         setState(() {
//           _errorMessage = 'An unexpected error occurred.';
//         });
//         print('General Error: $e');
//       } finally {
//         if (mounted) {
//           setState(() {
//             _isLoading = false;
//           });
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         foregroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 20),

//               // Welcome Text
//               const Text(
//                 'Get Started!',
//                 style: TextStyle(
//                   fontSize: 26,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFFFFFA8D),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'Create an account to continue',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey[600],
//                 ),
//               ),

//               const SizedBox(height: 32),

//               TextFormField(
//                 controller: _nameController,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   labelText: 'Full Name',
//                   hintText: 'Enter your full name',
//                   hintStyle: TextStyle(color: Colors.grey[400]),
//                   labelStyle: TextStyle(color: Colors.white),
//                   prefixIcon: Icon(Icons.person_outline, color: Colors.white),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide:
//                         const BorderSide(color: Color(0xFFFFFA8D), width: 2),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   if (value.trim().length < 2) {
//                     return 'Name must be at least 2 characters';
//                   }
//                   return null;
//                 },
//               ),

//               const SizedBox(height: 16),

//               // Email Field
//               TextFormField(
//                 controller: _emailController,
//                 style: const TextStyle(color: Colors.white),
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   hintText: 'Enter your email',
//                   hintStyle: TextStyle(color: Colors.grey[400]),
//                   labelStyle: TextStyle(color: Colors.white),
//                   prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide:
//                         const BorderSide(color: Color(0xFFFFFA8D), width: 2),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
//                       .hasMatch(value)) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//               ),

//               const SizedBox(height: 16),

//               TextFormField(
//                 controller: _passwordController,
//                 style: const TextStyle(color: Colors.white),
//                 obscureText: _obscurePassword,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   hintText: 'Enter your password',
//                   hintStyle: TextStyle(color: Colors.grey[400]),
//                   labelStyle: TextStyle(color: Colors.white),
//                   prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscurePassword
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                       color: Colors.white,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscurePassword = !_obscurePassword;
//                       });
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide:
//                         const BorderSide(color: Color(0xFFFFFA8D), width: 2),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   if (value.length < 6) {
//                     return 'Password must be at least 6 characters';
//                   }
//                   return null;
//                 },
//               ),

//               const SizedBox(height: 16),

//               // Confirm Password Field
//               TextFormField(
//                 controller: _confirmPasswordController,
//                 style: const TextStyle(color: Colors.white),
//                 obscureText: _obscureConfirmPassword,
//                 decoration: InputDecoration(
//                   labelText: 'Confirm Password',
//                   hintText: 'Confirm your password',
//                   hintStyle: TextStyle(color: Colors.grey[400]),
//                   labelStyle: TextStyle(color: Colors.white),
//                   prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscureConfirmPassword
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                       color: Colors.white,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscureConfirmPassword = !_obscureConfirmPassword;
//                       });
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide:
//                         const BorderSide(color: Color(0xFFFFFA8D), width: 2),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please confirm your password';
//                   }
//                   if (value != _passwordController.text) {
//                     return 'Passwords do not match';
//                   }
//                   return null;
//                 },
//               ),

//               const SizedBox(height: 32),

//               // Register Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 56,
//                 child: ElevatedButton(
//                   onPressed: _isLoading ? null : _createAccount,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFFFFFA8D),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: _isLoading
//                       ? const SizedBox(
//                           height: 20,
//                           width: 20,
//                           child: CircularProgressIndicator(
//                             strokeWidth: 2,
//                             valueColor:
//                                 AlwaysStoppedAnimation<Color>(Colors.black),
//                           ),
//                         )
//                       : const Text(
//                           'Create Account',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                 ),
//               ),

//               const SizedBox(height: 24),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Already have an account?',
//                     style: TextStyle(
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text(
//                       'Sign In',
//                       style: TextStyle(
//                         color: Color(0xFFFFFA8D),
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 16),

//               // Error Message
//               if (_errorMessage != null)
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Colors.red.withOpacity(0.1),
//                     border: Border.all(color: Colors.red),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Text(
//                     _errorMessage!,
//                     style: const TextStyle(
//                       color: Colors.red,
//                       fontSize: 14,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'payment_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _createAccount() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });
      
      try {
        // Create user account with Firebase
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Check if user was created successfully
        if (credential.user != null) {
          try {
            // Update user profile with display name
            await credential.user!.updateDisplayName(_nameController.text.trim());
          } catch (profileError) {
            // Profile update failed but user was created, continue to payment
            print('Profile update error (non-critical): $profileError');
          }
          
          // Add a small delay to ensure Firebase state is updated
          await Future.delayed(const Duration(milliseconds: 500));
          
          // Navigate to payment screen on successful registration
          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PaymentScreen(amount: 2784.00),
              ),
            );
          }
        }
        
      } on FirebaseAuthException catch (e) {
        setState(() {
          switch (e.code) {
            case 'weak-password':
              _errorMessage = 'The password provided is too weak.';
              break;
            case 'email-already-in-use':
              _errorMessage = 'An account already exists for this email.';
              break;
            case 'invalid-email':
              _errorMessage = 'The email address is badly formatted.';
              break;
            case 'operation-not-allowed':
              _errorMessage = 'Email/password accounts are not enabled.';
              break;
            default:
              _errorMessage = e.message ?? 'An error occurred during registration.';
          }
        });
        print('Firebase Auth Error: ${e.code} - ${e.message}');
      } catch (e) {
        // Handle the specific type casting error
        String errorString = e.toString();
        if (errorString.contains('PigeonUserDetails') || 
            errorString.contains('type cast') ||
            errorString.contains('List<Object?>')) {
          
          // This error occurs after successful user creation
          // Check if user is actually signed in despite the error
          User? currentUser = FirebaseAuth.instance.currentUser;
          if (currentUser != null) {
            print('User created successfully despite type cast error');
            
            // Add delay and navigate to payment screen
            await Future.delayed(const Duration(milliseconds: 500));
            
            if (mounted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentScreen(amount: 2784.00),
                ),
              );
              return; // Exit early since registration was actually successful
            }
          }
        }
        
        setState(() {
          _errorMessage = 'Account created but there was a minor issue. Please try signing in.';
        });
        print('General Error: $e');
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Welcome Text
              const Text(
                'Get Started!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFA8D),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Create an account to continue',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),

              const SizedBox(height: 32),

              TextFormField(
                controller: _nameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.person_outline, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xFFFFFA8D), width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  if (value.trim().length < 2) {
                    return 'Name must be at least 2 characters';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Email Field
              TextFormField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xFFFFFA8D), width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _passwordController,
                style: const TextStyle(color: Colors.white),
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xFFFFFA8D), width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Confirm Password Field
              TextFormField(
                controller: _confirmPasswordController,
                style: const TextStyle(color: Colors.white),
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm your password',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xFFFFFA8D), width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 32),

              // Register Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _createAccount,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFFA8D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                          ),
                        )
                      : const Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color(0xFFFFFA8D),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Error Message
              if (_errorMessage != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}