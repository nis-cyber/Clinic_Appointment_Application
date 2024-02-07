import 'package:flutter/material.dart';
import 'package:healthapp/Admin/features/dashboard/admin_dashboard_Screen.dart';
import 'package:healthapp/Admin/features/dashboard/clinic_home_screen.dart';
import 'package:healthapp/Admin/features/doctors/pages/my_doctors_page.dart';
import 'package:healthapp/Admin/pages/appointment_page.dart';

import 'package:healthapp/Admin/pages/patient_page.dart';

class ClinicBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;
  final int selectedIndex;

  ClinicBottomNavigationBar({
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xff1251b0),
      selectedItemColor: const Color(0xffc16a6a),
      unselectedItemColor: const Color(0xffdaf1c3),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Appointments',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Patients',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Doctors',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
      ],
    );
  }
}

class ClinicBottomNavBar extends StatefulWidget {
  @override
  _ClinicBottomNavBarState createState() => _ClinicBottomNavBarState();
}

class _ClinicBottomNavBarState extends State<ClinicBottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Patients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
        ],
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return ClinicHomeScreen();
      case 1:
        return const AppointmentPage();
      case 2:
        return const PatientPage();
      case 3:
        return MyDoctorPage();
      case 4:
        return AdminDashboard();
      default:
        return Container();
    }
  }
}
