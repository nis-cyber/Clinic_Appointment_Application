// import 'package:flutter/material.dart';
//
// import '../models/doctor_model.dart';
//
// class ReviewsDisplayPage extends StatelessWidget {
//   final DoctorModel doctor;
//
//   ReviewsDisplayPage({required this.doctor});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Reviews for ${doctor.name}'),
//       ),
//       body: ListView.builder(
//         itemCount: doctor.reviews.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text('Rating: ${doctor.reviews[index].rating}'),
//             subtitle: Text(doctor.reviews[index].comment),
//           );
//         },
//       ),
//     );
//   }
// }
