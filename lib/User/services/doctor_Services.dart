import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthapp/Admin/features/doctors/services/doctor_model.dart';

class DoctorService {
  final CollectionReference _doctorsCollection =
      FirebaseFirestore.instance.collection('doctors');

  Future<List<DoctorDataModel>> getAllDoctors() async {
    try {
      QuerySnapshot querySnapshot = await _doctorsCollection.get();
      return querySnapshot.docs.map((QueryDocumentSnapshot doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return DoctorDataModel(
          name: data['doctorName'],
          specialty: data['doctorSpecialty'],
          contactInfo: data['doctorContactInfo'],
          workingHours: data['doctorWorkingHours'],
          doctorImage: data['doctorImage'],
        );
      }).toList();
    } catch (e) {
      throw Exception('Error getting doctors: $e');
    }
  }
}

// // Method to add a new doctor to firebase firestore
// Future<void> addDoctor(DoctorDataModel doctor) async {
//   try {
//     await _doctorsollection('doctors').add({
//       'doctorName': doctor.name,
//       'doctorSpecialty': doctor.specialty,
//       'doctorContactInfo': doctor.contactInfo,
//       'doctorWorkingHours': doctor.workingHours,
//       'doctorImage': doctor.doctorImage,
//     });
//   } catch (e) {
//     throw Exception('Error adding doctor: $e');
//   }
// }

// Method to  update existing  a doctor in firebase firestore
// Future<void> updateDoctor(DoctorDataModel doctor) async {
//   try {
//     final userId = FirebaseAuth.instance.currentUser!.uid;
//     await FirebaseFirestore.instance.collection('doctors').doc(doctor.).update({
//       'doctorName': doctor.name,
//       'doctorSpecialty': doctor.specialty,
//       'doctorContactInfo': doctor.contactInfo,
//       'doctorWorkingHours': doctor.workingHours,
//       'doctorImage': doctor.doctorImage,
//     });
//   } catch (e) {
//     throw Exception('Error updating doctor: $e');
//   }
// }

// // metho to delete a doctor from firebase firestore
// Future<void> deleteDoctor(String doctorId) async {
//   try {
//     await _doctors.collection('doctors').doc(doctorId).delete();
//   } catch (e) {
//     throw Exception('Error deleting doctor: $e');
//   }
// }
