import 'package:flutter/material.dart';
import 'package:healthapp/Admin/features/doctors/services/doctor_model.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final DoctorDataModel doctorData;

  DoctorDetailsScreen({required this.doctorData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctorData.name),
      ),
      body: Column(
        children: <Widget>[
          Text('Specialty: ${doctorData.specialty}'),
          Text('Contact Info: ${doctorData.contactInfo}'),
          Text('Working Hours: ${doctorData.workingHours}'),
        ],
      ),
    );
  }
}
