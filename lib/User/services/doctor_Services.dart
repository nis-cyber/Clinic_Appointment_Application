import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthapp/Admin/features/doctors/services/doctor_model.dart';

class DoctorService {
  final CollectionReference _doctorsCollection =
      FirebaseFirestore.instance.collection('doctors');

  Future<List<DoctorDataModel>> getAllDoctors() async {
    QuerySnapshot querySnapshot = await _doctorsCollection.get();
    return querySnapshot.docs.map((doc) {
      return DoctorDataModel(
        name: doc['doctorName'],
        specialty: doc['doctorSpecialty'],
        contactInfo: doc['doctorContactInfo'],
        workingHours: doc['doctorWorkingHours'],
        doctorImage: doc['doctorImage'],
      );
    }).toList();
  }
}
