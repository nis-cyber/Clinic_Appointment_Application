import 'package:flutter/material.dart';
// import 'package:clinic_appointment_app/screens/hospital_screen.dart';
// import 'package:clinic_appointment_app/widgets/health_needs.dart';
// import 'package:clinic_appointment_app/screens/appointment_screen.dart';
// import 'package:clinic_appointment_app/screens/hospital_screen.dart';
// import 'package:clinic_appointment_app/screens/covid_screen.dart';
// import 'package:clinic_appointment_app/screens/more_health_needs_screen.dart';
// Remove the unused import directive
// import 'package:healthapp/screens/hospitalScreen.dart';

class HealthNeeds extends StatelessWidget {
  const HealthNeeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CustomIcon> customIcons = [
      CustomIcon(icon: 'assets/appointment.png', name: 'Appointment'),
      CustomIcon(icon: 'assets/hospital.png', name: 'Hospital'),
      CustomIcon(icon: 'assets/virus.png', name: 'Covid-19'),
      CustomIcon(icon: 'assets/more.png', name: 'More'),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        customIcons.length,
        (index) {
          return GestureDetector(
            onTap: () {},
            //   if (index == 0) {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => AppointmentScreen(),
            //       ),
            //     );
            //   } else if (index == 1) {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => HospitalScreen,
            //       ),
            //     );
            //   } else if (index == 2) {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => CovidScreen(),
            //       ),
            //     );
            //   } else if (index == 3) {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => MoreHealthNeedsScreen(),
            //       ),
            //     );
            //   }
            // },
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.4),
                  ),
                  child: Image.asset(customIcons[index].icon),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(customIcons[index].name)
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomIcon {
  final String icon;
  final String name;

  CustomIcon({
    required this.icon,
    required this.name,
  });
}


// why idk but copiloit recommend me to add this file
// health_needs.dart
// Path: lib/widgets/health_needs.dart
// Compare this snippet from lib/pages/leave_review_page.dart:
// // import 'package:flutter/material.dart';
// //
// // import '../models/doctor_model.dart';
// //
// // class LeaveReviewPage extends StatefulWidget {
// //   final DoctorModel doctor;
// //
// //   LeaveReviewPage({required this.doctor});
// //
// //   @override
// //   _LeaveReviewPageState createState() => _LeaveReviewPageState();
// // }
// //
// // class _LeaveReviewPageState extends State<LeaveReviewPage> {
// //   double rating = 0.0;
// //   TextEditingController commentController = TextEditingController();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Leave a Review for ${widget.doctor.name}'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text('Rating:'),
// //             Slider(
// //               value: rating,
// //               onChanged: (value) {
// //                 setState(() {
// //                   rating = value;
// //                 });
// //               },
// //               min: 0.0,
// //               max: 5.0,
// //               divisions: 5,
// //               label: rating.toString(),
// //             ),
// //             SizedBox(height: 16),
// //             Text('Leave a Comment:'),
// //             TextFormField(
// //               controller: commentController,
// //               maxLines: 3,
// //             ),
// //             SizedBox(height: 16),
// //             ElevatedButton(
// //               onPressed: () {
// //                 // Save the review and navigate back
// //                 saveReview();
// //               },
// //               child: Text('Submit Review'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   void saveReview() {
// //     // Save the review to the database
// //     // ...
// //     // Navigate back to the doctor's profile
// //     Navigator.of(context).pop();
// //   }
// // }