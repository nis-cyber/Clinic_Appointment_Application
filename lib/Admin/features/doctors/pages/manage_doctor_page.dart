// import 'package:flutter/material.dart';
// import 'package:healthapp/Admin/features/doctors/services/doctor_model.dart';
// import 'package:healthapp/Admin/features/doctors/pages/add_doctors_page.dart';
// import 'package:healthapp/Admin/features/doctors/pages/my_doctor_detail_page.dart';

// class ManageDoctorScreen extends StatefulWidget {
//   @override
//   _ManageDoctorScreenState createState() => _ManageDoctorScreenState();
// }

// class _ManageDoctorScreenState extends State<ManageDoctorScreen> {
//   List<Doctor> doctors = [];
//   // List to store all doctors

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: SizedBox.shrink(),
//         backgroundColor: Colors.blue,
//         elevation: 4,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xff439de7), Color(0xff3e6887)], // Blue gradient
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//         ),
//         child: ListView.builder(
//           itemCount: doctors.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(doctors[index].name),
//               subtitle: Text(doctors[index].specialty),
//               onTap: () {
//                 // Open doctor details screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         DoctorDetailsScreen(doctor: doctors[index]),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         hoverColor: Color(0xff43b2b2),
//         onPressed: () async {
//           // Open add new doctor form
//           Doctor? newDoctor = await Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddDoctorScreen(),
//             ),
//           );
//           if (newDoctor != null) {
//             setState(() {
//               doctors.add(newDoctor);
//             });
//           }
//         },
//         backgroundColor: Colors.blue, // Set FAB background color
//         child: Icon(Icons.post_add),
//         tooltip: 'Add Doctor',
//       ),
//     );
//   }
// }
