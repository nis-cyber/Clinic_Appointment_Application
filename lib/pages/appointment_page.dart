import 'package:flutter/material.dart';
import '../models/doctor_model.dart';

   class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});
//
  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }


// class AppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book an Appointment'),
      ),
      body: ListView.builder(
        itemCount: nearbyDoctors.length,
        itemBuilder: (context, index) {
          return DoctorCard(doctor: nearbyDoctors[index]);
        },
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;

  DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(doctor.profile),
        ),
        title: Text(doctor.name),
        subtitle: Text(doctor.position),
        trailing: ElevatedButton(
          onPressed: () {
            // Handle appointment booking logic here
            showAppointmentConfirmation(context, doctor);
          },
          child: Text('Book Appointment'),
        ),
      ),
    );
  }

  void showAppointmentConfirmation(BuildContext context, DoctorModel doctor) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Appointment Confirmation'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('You are booking an appointment with Dr. ${doctor.name}.'),
              SizedBox(height: 10),
              Text('Position: ${doctor.position}'),
              SizedBox(height: 10),
              Text('Average Review: ${doctor.averageReview}'),
              SizedBox(height: 10),
              Text('Total Reviews: ${doctor.totalRewiew}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle appointment booking confirmation logic here
                Navigator.of(context).pop();
                showSuccessMessage(context);
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void showSuccessMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Appointment Booked'),
          content: Text('Your appointment has been successfully booked!'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

