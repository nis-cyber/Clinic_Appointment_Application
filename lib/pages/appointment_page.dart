// import 'package:flutter/material.dart';
// import '../models/doctor_model.dart';

// class AppointmentPage extends StatefulWidget {
//   const AppointmentPage({super.key});

//   @override
//   State<AppointmentPage> createState() => _AppointmentPageState();
// }

// class _AppointmentPageState extends State<AppointmentPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Book an Appointment'),
//       ),
//       body: ListView.builder(
//         itemCount: nearbyDoctors.length,
//         itemBuilder: (context, index) {
//           return DoctorCard(doctor: nearbyDoctors[index]);
//         },
//       ),
//     );
//   }
// }

// class DoctorCard extends StatelessWidget {
//   final DoctorModel doctor;

//   DoctorCard({required this.doctor});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(16),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundImage: AssetImage(doctor.profile),
//         ),
//         title: Text(doctor.name),
//         subtitle: Text(doctor.position),
//         trailing: ElevatedButton(
//           onPressed: () {
//             // Handle appointment booking logic here
//             showAppointmentConfirmation(context, doctor);
//           },
//           child: Text('Book Appointment'),
//         ),
//       ),
//     );
//   }

//   void showAppointmentConfirmation(BuildContext context, DoctorModel doctor) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Appointment Confirmation'),
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('You are booking an appointment with Dr. ${doctor.name}.'),
//               SizedBox(height: 10),
//               Text('Position: ${doctor.position}'),
//               SizedBox(height: 10),
//               Text('Average Review: ${doctor.averageReview}'),
//               SizedBox(height: 10),
//               Text('Total Reviews: ${doctor.totalRewiew}'),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle appointment booking confirmation logic here
//                 Navigator.of(context).pop();
//                 showSuccessMessage(context);
//               },
//               child: Text('Confirm'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void showSuccessMessage(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Appointment Booked'),
//           content: Text('Your appointment has been successfully booked!'),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
// }
// here i the follwing up code works for booking an appointment in which it show book an aapoinmwnt now below down the here a view

import 'package:flutter/material.dart';
import 'package:healthapp/models/doctor_model.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  List<DoctorModel> nearbyDoctors = [
    DoctorModel(
      name: 'Dr. John Doe',
      position: 'Cardiologist',
      profile: 'assets/images/doctor1.png',
      averageReview: 4,
      totalReview: 100,
      totalRewiew: 100,
    ),
    DoctorModel(
      name: 'Dr. Jane Smith',
      position: 'Dermatologist',
      profile: 'assets/images/doctor2.png',
      averageReview: 4,
      totalReview: 80,
      totalRewiew: 80,
    ),
    DoctorModel(
      name: 'Dr. Alex Johnson',
      position: 'Pediatrician',
      profile: 'assets/images/doctor3.png',
      averageReview: 4,
      totalReview: 120,
      totalRewiew: 120,
    ),

    // Add more doctors here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Page'),
      ),
      body: ListView.builder(
        itemCount: nearbyDoctors.length,
        itemBuilder: (context, index) {
          return DoctorCard(
            doctor: nearbyDoctors[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DoctorDetailPage(doctor: nearbyDoctors[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;
  final VoidCallback onTap;

  DoctorCard({required this.doctor, required this.onTap});

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
          onPressed: onTap,
          child: Text('View'),
        ),
      ),
    );
  }
}

class DoctorDetailPage extends StatelessWidget {
  final DoctorModel doctor;

  DoctorDetailPage({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(doctor.profile),
              radius: 80,
            ),
            SizedBox(height: 16),
            Text(
              doctor.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              doctor.position,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Average Review: ${doctor.averageReview}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Total Reviews: ${doctor.totalRewiew}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// ---- this one is for adding date and time -----

// import 'package:flutter/material.dart';
// import 'doctorDetail_page.dart';

// class AppointmentPage extends StatelessWidget {
//   final DoctorModel doctor;
//   final String selectedDate;
//   final String selectedTime;

//   AppointmentPage({
//     required this.doctor,
//     required this.selectedDate,
//     required this.selectedTime,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Appointment'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               backgroundImage: AssetImage(doctor.profile),
//               radius: 80,
//             ),
//             SizedBox(height: 16),
//             Text(
//               doctor.name,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               doctor.position,
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Selected Date: $selectedDate',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Selected Time: $selectedTime',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DoctorCard extends StatelessWidget {
//   final DoctorModel doctor;
//   final VoidCallback onTap;

//   DoctorCard({required this.doctor, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(16),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundImage: AssetImage(doctor.profile),
//         ),
//         title: Text(doctor.name),
//         subtitle: Text(doctor.position),
//         trailing: ElevatedButton(
//           onPressed: () {
//             // Pass the selected doctor's information to the appointment page
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => AppointmentPage(
//                   doctor: doctor,
//                   selectedDate: '2022-01-01', // Replace with the selected date
//                   selectedTime: '10:00 AM', // Replace with the selected time
//                 ),
//               ),
//             );
//           },
//           child: Text('View'),
//         ),
//       ),
//     );
//   }
// }

// class DoctorDetailPage extends StatelessWidget {
//   final DoctorModel doctor;

//   DoctorDetailPage({required this.doctor});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Doctor Detail'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               backgroundImage: AssetImage(doctor.profile),
//               radius: 80,
//             ),
//             SizedBox(height: 16),
//             Text(
//               doctor.name,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               doctor.position,
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Average Review: ${doctor.averageReview}',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Total Reviews: ${doctor.totalReview}',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DoctorModel {
//   final String name;
//   final String position;
//   final String profile;
//   final double averageReview;
//   final int totalReview;

//   DoctorModel({
//     required this.name,
//     required this.position,
//     required this.profile,
//     required this.averageReview,
//     required this.totalReview,
//   });
// }

// class DoctorModel {
//   final String name;
//   final String position;
//   final String profile;
//   final double averageReview;
//   final int totalReview;

//   DoctorModel({
//     required this.name,
//     required this.position,
//     required this.profile,
//     required this.averageReview,
//     required this.totalReview,
//   });
// }

// import 'package:flutter/material.dart';
// import '../models/doctor_model.dart';

// class AppointmentPage extends StatefulWidget {
//   AppointmentPage({Key? key}) : super(key: key);

//   @override
//   _AppointmentPageState createState() => _AppointmentPageState();
// }

// class _AppointmentPageState extends State<AppointmentPage> {
//   final List<DoctorModel> doctors = [
//     DoctorModel(
//       name: 'Dr. John Doe',
//       position: 'Cardiologist',
//       profile: 'assets/images/doctor1.png',
//       averageReview: 4.5,
//       totalReview: 100,
//     ),
//     // Add more doctors here
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Appointment'),
//       ),
//       body: ListView.builder(
//         itemCount: doctors.length,
//         itemBuilder: (context, index) {
//           final doctor = doctors[index];
//           return ListTile(
//             leading: Image.asset(doctor.profile),
//             title: Text(doctor.name),
//             subtitle: Text(doctor.position),
//             trailing: Text('Average review: ${doctor.averageReview}'),
//           );
//         },
//       ),
//     );
//   }
// }
