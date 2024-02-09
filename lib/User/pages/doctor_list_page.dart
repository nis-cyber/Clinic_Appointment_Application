import 'package:flutter/material.dart';
import 'package:healthapp/Admin/features/doctors/services/doctor_model.dart';
import 'package:healthapp/User/features/appointment/appointment_page.dart';
import 'package:healthapp/User/services/doctor_Services.dart';
// Assuming this is the doctor details page file

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({super.key});

  @override
  _DoctorListPageState createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  late Future<List<DoctorDataModel>> _doctorListFuture;
  final DoctorService _doctorService = DoctorService();

  @override
  void initState() {
    super.initState();
    _doctorListFuture = _doctorService.getAllDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor List'),
      ),
      body: FutureBuilder<List<DoctorDataModel>>(
        future: _doctorListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                DoctorDataModel doctor = snapshot.data![index];
                return ListTile(
                  title: Text(doctor.name),
                  subtitle: Text(doctor.specialty),
                  onTap: () {
                    // Navigate to doctor details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorDetailPage(doctor: doctor),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
