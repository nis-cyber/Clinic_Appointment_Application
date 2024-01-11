import 'package:flutter/material.dart';

class DoctorModel {
  final String name;
  final String position;
  final int averageReview;
  final int totalRewiew;
  final String profile;
  DoctorModel({
    required this.name,
    required this.position,
    required this.averageReview,
    required this.totalRewiew,
    required this.profile,
  });
}

List<DoctorModel> nearbyDoctors = [
  DoctorModel(
    name: "Luke Holland",
    position: "General Practitioner",
    averageReview: 3,
    totalRewiew: 195,
    profile: 'assets/doctor_1.jpg',
  ),
  DoctorModel(
    name: "Sophie harmon",
    position: "General Practitioner",
    averageReview: 4,
    totalRewiew: 214,
    profile: 'assets/doctor_2.jpg',
  ),
  DoctorModel(
    name: "Louise Reid",
    position: "General Practitioner",
    averageReview: 4,
    totalRewiew: 233,
    profile: 'assets/doctor_3.jpg',
  ),
];
