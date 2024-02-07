import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthapp/Admin/features/doctors/services/doctor_model.dart';

class DoctorDataSource {
  final postDb = FirebaseFirestore.instance.collection('doctors');
  final CollectionReference _doctors =
      FirebaseFirestore.instance.collection('doctors');

  Future<String> addDoctor({
    required String doctorName,
    required String doctorSpecialty,
    required String doctorContactInfo,
    required String doctorWorkingHours,
    required String doctorImage,
  }) async {
    try {
      await postDb.add({
        'doctorName': doctorName,
        'doctorSpecialty': doctorSpecialty,
        'doctorContactInfo': doctorContactInfo,
        'doctorWorkingHours': doctorWorkingHours,
        'postCreatedAt': DateTime.now().microsecondsSinceEpoch.toString(),
      });
      return 'Doctor Added';
    } on FirebaseException catch (err) {
      return '${err.message}';
    }
  }

  Future<List<DoctorDataModel>> getAllDoctors() async {
    QuerySnapshot querySnapshot = await _doctors.get();
    return querySnapshot.docs.map((doc) {
      return DoctorDataModel(
        name: doc['doctorName'],
        specialty: doc['doctorSpecialty'],
        contactInfo: doc['doctorWorkingHours'],
        workingHours: doc['doctorWorkingHours'],
      );
    }).toList();
  }

  // Future<String> deletePost({required String postId}) async {
  //   try {
  //     await postDb.doc(postId).delete();

  //     return 'Post Deleted';
  //   } on FirebaseException catch (err) {
  //     return '${err.message}';
  //   }
  // }

  // Future<String> updatePost({
  //   required DoctorDataModel DoctorDataModel,
  // }) async {
  //   try {
  //     await postDb.doc(DoctorDataModel.postId).update({
  //       'postHeadline': DoctorDataModel.postHeadline,
  //       'postAddress': DoctorDataModel.postAddress,
  //       'postContact': DoctorDataModel.postContact,
  //       'postContent': DoctorDataModel.postContent,
  //       'postImageUrl': DoctorDataModel.postImageUrl,
  //       'postCreatedAt': DateTime.now().microsecondsSinceEpoch.toString(),
  //     });

  //     return 'Post Updated';
  //   } on FirebaseException catch (err) {
  //     return '${err.message}';
  //   }
  // }

  // Future<List<Post>> getPostByPostId({required String postId}) async {
  //   try {
  //     final querySnapshot =
  //         await postDb.where('postId', isEqualTo: postId).get();

  //     return querySnapshot.docs
  //         .map((doc) => Post.fromJson({
  //               ...doc.data(),
  //               'postId': doc.id,
  //             }))
  //         .toList();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
