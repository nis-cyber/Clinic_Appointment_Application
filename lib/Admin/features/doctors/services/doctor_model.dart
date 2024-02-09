//so this code is fine
// but the problem is that the DoctorDataModel is not defined in the file lib/Admin/features/doctors/services/doctor_model.dart
// so to fix this issue we need to define the DoctorDataModel in the file lib/Admin/features/doctors/services/doctor_model.dart
// so the final code will be:
// import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorDataModel {
  final String name;
  final String specialty;
  final String contactInfo;
  final String workingHours;
  String? doctorImage; // Define the missing variable here

  DoctorDataModel({
    required this.name,
    required this.specialty,
    required this.contactInfo,
    required this.workingHours,
    this.doctorImage, // Add the missing variable here
  });

  factory DoctorDataModel.fromJson(Map<String, dynamic> json) {
    return DoctorDataModel(
      name: json['name'],
      specialty: json['specialty'],
      contactInfo: json['contactInfo'],
      workingHours: json['workingHours'],
      doctorImage: json['doctorImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialty': specialty,
      'contactInfo': contactInfo,
      'workingHours': workingHours,
      'doctorImage': doctorImage,
    };
  }
}
