import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
      backgroundColor: Color(0xff1251b0),
      selectedItemColor: Color(0xffc16a6a),
      unselectedItemColor: Color(0xffdaf1c3),
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
          icon: Icon(Icons.bar_chart),
          label: 'Reports',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
      ],
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: ClinicBottomNavigationBarPage(),
//   ));
// }

class ClinicBottomNavigationBarPage extends StatefulWidget {
  @override
  _ClinicBottomNavigationBarPageState createState() =>
      _ClinicBottomNavigationBarPageState();
}

class _ClinicBottomNavigationBarPageState
    extends State<ClinicBottomNavigationBarPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clinic Dashboard'),
      ),
      body: _buildPage(_currentIndex),
      bottomNavigationBar: ClinicBottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedIndex: _currentIndex,
      ),
      extendBody: true,
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return ChomeScreen();
      case 1:
        return AppointmentsPage();
      case 2:
        return PatientsPage();
      case 3:
        return ReportsPage();
      case 4:
        return AdminDashboard();
      default:
        return Container();
    }
  }
}

class ChomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PatientsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
