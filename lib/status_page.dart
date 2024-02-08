import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/Admin/features/auth/loginScreen.dart';
import 'package:healthapp/Admin/widgets/clinic_bottom_nav_bar.dart';
import 'package:healthapp/main.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final User user = snapshot.data as User;
            return FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('clinics')
                  .doc(user.uid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.exists) {
                    // User is in 'clinics' collection
                    return ClinicBottomNavBar();
                  } else {
                    // User is not in 'clinics' collection, check 'users' collection
                    return FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.uid)
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data!.exists) {
                          // User is in 'users' collection
                          return MainPage();
                        } else {
                          // User is not in 'users' collection, show login screen
                          return LoginScreen();
                        }
                      },
                    );
                  }
                } else if (snapshot.hasError) {
                  // Handle error
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Show loading spinner while waiting for data
                  return CircularProgressIndicator();
                }
              },
            );
          } else {
            // User is not logged in
            return LoginScreen();
          }
        },
      ),
    );
  }
}
