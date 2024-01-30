// import 'package:flutter/material.dart';
//
// import '../models/doctor_model.dart';
//
// class LeaveReviewPage extends StatefulWidget {
//   final DoctorModel doctor;
//
//   LeaveReviewPage({required this.doctor});
//
//   @override
//   _LeaveReviewPageState createState() => _LeaveReviewPageState();
// }
//
// class _LeaveReviewPageState extends State<LeaveReviewPage> {
//   double rating = 0.0;
//   TextEditingController commentController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Leave a Review for ${widget.doctor.name}'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Rating:'),
//             Slider(
//               value: rating,
//               onChanged: (value) {
//                 setState(() {
//                   rating = value;
//                 });
//               },
//               min: 0.0,
//               max: 5.0,
//               divisions: 5,
//               label: rating.toString(),
//             ),
//             SizedBox(height: 16),
//             Text('Leave a Comment:'),
//             TextFormField(
//               controller: commentController,
//               maxLines: 3,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 // Save the review and navigate back
//                 saveReview();
//               },
//               child: Text('Submit Review'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void saveReview() {
//     // Implement logic to save the review
//     // For example, update the DoctorModel with the new review
//     // and notify listeners or update the database
//
//     // After saving, navigate back to the reviews display page
//     Navigator.pop(context);
//   }
// }
