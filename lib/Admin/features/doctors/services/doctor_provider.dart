import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthapp/Admin/features/doctors/services/doctor_model.dart';
import 'package:healthapp/Admin/features/doctors/services/doctor_service.dart';

final getAllDoctorsProvider = FutureProvider.autoDispose<List<DoctorDataModel>>(
  (ref) => DoctorDataSource().getAllDoctors(),
);
