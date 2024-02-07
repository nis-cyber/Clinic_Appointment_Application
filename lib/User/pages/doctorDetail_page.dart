// import 'package:flutter/material.dart';
//
// class DoctorDetailPage extends StatefulWidget {
//   const DoctorDetailPage({super.key});
//
//   @override
//   State<DoctorDetailPage> createState() => _DoctorDetailPageState();
// }
// class _DoctorDetailPageState extends State<DoctorDetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Doctor Details'),
//       ),
//       body: Center(
//         child: Text('Doctor Details Page Content'),
//       ),
//     );
//   }
// }
//
// // doctor_detail_page.dart
//
//
// import '../models/doctor_model.dart';
//
// class DoctorDetailPage extends StatelessWidget {
//   final DoctorModel doctor;
//
//   DoctorDetailPage({required this.doctor});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Doctor Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               backgroundImage: AssetImage(doctor.profile),
//               radius: 50,
//             ),
//             SizedBox(height: 16),
//             Text('Name: ${doctor.name}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Text('Position: ${doctor.position}', style: TextStyle(fontSize: 16)),
//             SizedBox(height: 8),
//             Text('Average Review: ${doctor.averageReview}', style: TextStyle(fontSize: 16)),
//             SizedBox(height: 8),
//             Text('Total Reviews: ${doctor.totalRewiew}', style: TextStyle(fontSize: 16)),
//             // Add more details as needed
//           ],
//         ),
//       ),
//     );
//   }
// }
