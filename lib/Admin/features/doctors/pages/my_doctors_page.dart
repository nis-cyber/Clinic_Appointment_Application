import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthapp/Admin/features/doctors/pages/add_doctors_page.dart';
import 'package:healthapp/Admin/features/doctors/pages/my_doctor_detail_page.dart';
import 'package:healthapp/Admin/features/doctors/services/doctor_model.dart';
import 'package:healthapp/Admin/features/doctors/services/doctor_provider.dart';
import 'package:healthapp/User/pages/appointment_page.dart';

class MyDoctorPage extends ConsumerStatefulWidget {
  const MyDoctorPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyDoctorPage> createState() => _MyDoctorPageState();
}

class _MyDoctorPageState extends ConsumerState<MyDoctorPage> {
  @override
  Widget build(BuildContext context) {
    final postData = ref.watch(getAllDoctorsProvider);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            elevation: 0,
            title: const Text(
              'MY POSTS',
              style: TextStyle(letterSpacing: 6),
            ),
          ),
          body: postData.when(
            data: (data) {
              return data.isEmpty
                  ? const Center(
                      child: Text(
                      'No Doctors',
                      style: TextStyle(fontSize: 20),
                    ))
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        final doctorData = data[index];
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorDetailsScreen(
                                          doctorData: doctorData,
                                        )));
                          },
                          title: Text(doctorData.name),
                          subtitle: Text(doctorData.specialty),
                        );
                      },
                      itemCount: data.length,
                    );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddDoctorScreen(),
                  ));
              if (result == 'Doctor Added') {
                setState(() {});
              }
            },
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            child: Icon(
              Icons.add,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          )),
    );
  }
}
