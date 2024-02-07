import 'package:flutter/material.dart';
import 'package:healthapp/Admin/features/auth/pages/clinic_login_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _selectedRole = '';

  void _navigateToHomeScreen() {
    if (_selectedRole == 'patient') {
      Navigator.pushReplacementNamed(context, '/patient_home');
    } else if (_selectedRole == 'doctor') {
      Navigator.pushReplacementNamed(context, '/doctor_login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ]),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Who Are \nYou',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Color.fromARGB(255, 186, 136, 75),
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.person, color: Colors.white),
                      label: Text(
                        'Patient',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedRole = 'patient';
                        });
                        _navigateToHomeScreen();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff281537),
                        minimumSize: Size(300, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      icon: Icon(Icons.medical_services, color: Colors.white),
                      label: Text(
                        'Clinic',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ClinicAuthScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff281537),
                        minimumSize: Size(300, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// i need to route this page when i clinic then it shoul route to clininc homepage and when i am patient it should route to patient homepage
// i need to add the route to the patient and clinic homepage
// while clincking in clinic it should route to clinic authenthication page
// 
