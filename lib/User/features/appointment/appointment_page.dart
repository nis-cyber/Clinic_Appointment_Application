// here i the follwing up code works for booking an appointment in which it show book an aapoinmwnt now below down the here a view

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/Admin/features/doctors/services/doctor_model.dart';
import 'package:healthapp/User/features/appointment/service/appointment_service.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  List<DoctorDataModel> nearbyDoctors = [
    DoctorDataModel(
      name: 'Dr. John Doe',
      specialty: 'Cardiologist',
      contactInfo: '123-456-7890',
      workingHours: '9:00 AM - 5:00 PM',
      doctorImage: 'assets/images/doctor1.png',
    ),
    DoctorDataModel(
      name: 'Dr. Jane Smith',
      specialty: 'Dermatologist',
      contactInfo: '123-456-7890',
      workingHours: '9:00 AM - 5:00 PM',
      doctorImage: 'assets/images/doctor2.png',
    ),
    DoctorDataModel(
      name: 'Dr. Alex Johnson',
      specialty: 'Pediatrician',
      contactInfo: '123-456-7890',
      workingHours: '9:00 AM - 5:00 PM',
      doctorImage: 'assets/images/doctor3.png',
    ),

    // Add more doctors here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Page'),
      ),
      body: StreamBuilder(
        stream: AppointmentService().getDoctors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Available Doctors',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        DoctorDataModel doctor = snapshot.data![index];
                        return DoctorCard(
                          doctor: doctor,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DoctorDetailPage(doctor: doctor),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final DoctorDataModel doctor;
  final VoidCallback onTap;

  const DoctorCard({super.key, required this.doctor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // leading: CircleAvatar(
        //   backgroundImage: AssetImage(doctor.doctorImage),
        // ),
        title: Text(doctor.name),
        subtitle: Text(doctor.specialty),
        trailing: ElevatedButton(
          onPressed: onTap,
          child: const Text('View'),
        ),
      ),
    );
  }
}

class DoctorDetailPage extends StatelessWidget {
  final DoctorDataModel doctor;

  const DoctorDetailPage({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(doctor.name),
                radius: 60,
              ),
              const SizedBox(height: 14),
              Text(
                doctor.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                doctor.specialty,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 4),
              Text(
                'Contact Information: ${doctor.contactInfo}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                'Working Hours: ${doctor.workingHours}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                'Doctor Image: ${doctor.doctorImage}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BookingPage(doctor: doctor)));
                },
                child: const Text('Book Appointment Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingPage extends StatefulWidget {
  final DoctorDataModel doctor;
  const BookingPage({super.key, required this.doctor});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final contactController = TextEditingController();
  final dateController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final reasonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text('Book an appointment here'),
                const SizedBox(height: 20),
                TextFieldWidget(
                  labelText: 'Name',
                  nameController: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  labelText: 'Contact Information',
                  nameController: contactController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your contact information';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  labelText: 'Address',
                  nameController: addressController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    border: const OutlineInputBorder(),
                    labelText: 'Date and Time',
                    suffixIcon: IconButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 30)),
                        ).then((value) {
                          if (value != null) {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((time) {
                              if (time != null) {
                                dateController.text =
                                    '${value.day}/${value.month}/${value.year} ${time.format(context)}';
                              }
                            });
                          }
                        });
                      },
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the date and time';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  labelText: 'Gender',
                  nameController: genderController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please specify your gender';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  labelText: 'Age',
                  nameController: ageController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  maxline: 3,
                  labelText: 'Symptoms',
                  nameController: reasonController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your symptoms';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await AppointmentService().bookAppointment(
                        AppointmentData(
                          doctorDataModel: widget.doctor,
                          appointmentDateTime: dateController.text.trim(),
                          userName: nameController.text.trim(),
                          userId: userId,
                          userContactInfo: contactController.text.trim(),
                          userAddress: addressController.text.trim(),
                          userAge: ageController.text.trim(),
                          userGender: genderController.text.trim(),
                          reason: reasonController.text.trim(),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Appointment booked successfully'),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    maximumSize: Size(double.infinity, 50),
                  ),
                  child: const Text('Book Appointment'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.nameController,
    required this.validator,
    required this.labelText,
    this.maxline,
  });

  final TextEditingController nameController;
  final String? Function(String?) validator;
  final String labelText;
  final int? maxline;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,
      controller: nameController,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.all(8),
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      validator: validator,
    );
  }
}
