// import 'package:flutter/material.dart';
// import 'package:healthapp/features/auth/pages/login_page.dart';

// class LoginOrRegister extends StatefulWidget {
//   const LoginOrRegister({super.key});

//   @override
//   State<LoginOrRegister> createState() => _LoginOrRegisterState();
// }

// class _LoginOrRegisterState extends State<LoginOrRegister> {
//   // initially, show  login page
//   bool showLoginPage = true;

//   // togle between login and register pages
//   void togglePages() {
//     setState(() {
//       showLoginPage = !showLoginPage;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showLoginPage) {
//       return LoginPage(
//         onTap: togglePages,
//       );
//     } else {
//       return const Text('No account');
//     }
//   }
// }
