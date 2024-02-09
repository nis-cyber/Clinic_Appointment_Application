import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthapp/Admin/features/doctors/services/doctor_model.dart';

class AppointmentService {
  final doctorDb = FirebaseFirestore.instance.collection('doctors');
  final appointmentDb = FirebaseFirestore.instance.collection('appointments');

  Stream<List<DoctorDataModel>> getDoctors() {
    try {
      final response = doctorDb.snapshots();
      final data = response.asyncMap((event) {
        return event.docs.map((e) {
          return DoctorDataModel(
            name: e['doctorName'],
            specialty: e['doctorSpecialty'],
            contactInfo: e['doctorContactInfo'],
            workingHours: e['doctorWorkingHours'],
          );
        }).toList();
      });
      return data;
    } on FirebaseException catch (e) {
      throw Exception('Error getting doctors: $e');
    }
  }

  Future<void> bookAppointment(AppointmentData appointmentData) async {
    try {
      await appointmentDb.add({
        'doctorInfo': appointmentData.doctorDataModel.toJson(),
        'appointmentDateTime': appointmentData.appointmentDateTime,
        'userName': appointmentData.userName,
        'userId': appointmentData.userId,
        'userContactInfo': appointmentData.userContactInfo,
        'userAddress': appointmentData.userAddress,
        'userAge': appointmentData.userAge,
        'userGender': appointmentData.userGender,
        'reason': appointmentData.reason,
      });
    } on FirebaseException catch (e) {
      throw Exception('Error booking appointment: $e');
    }
  }
}

class AppointmentData {
  final DoctorDataModel doctorDataModel;
  final String appointmentDateTime;
  final String userName;
  final String userId;
  final String userContactInfo;
  final String userAddress;
  final String userAge;
  final String userGender;
  final String reason;

  AppointmentData({
    required this.doctorDataModel,
    required this.appointmentDateTime,
    required this.userName,
    required this.userId,
    required this.userContactInfo,
    required this.userAddress,
    required this.userAge,
    required this.userGender,
    required this.reason,
  });
}
