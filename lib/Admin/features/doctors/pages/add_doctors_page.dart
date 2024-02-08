import 'dart:io';
import 'package:flutter/material.dart';
import 'package:healthapp/Admin/features/doctors/services/doctor_service.dart';
import 'package:image_picker/image_picker.dart';

class AddDoctorScreen extends StatefulWidget {
  const AddDoctorScreen({super.key});
  @override
  State<AddDoctorScreen> createState() => _AddDoctorScreenState();
}

class _AddDoctorScreenState extends State<AddDoctorScreen> {
  late File selectedImage;

  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController doctorSpecialtyController =
      TextEditingController();
  final TextEditingController doctorContactInfoController =
      TextEditingController();
  final TextEditingController doctorWorkingHoursController =
      TextEditingController();
  final ImagePicker picker = ImagePicker();

  // Function to handle image selection
  Future<void> _selectImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        selectedImage = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _submitForm() async {
    // Get other doctor details from text controllers
    String doctorName = doctorNameController.text;
    String doctorSpecialty = doctorSpecialtyController.text;
    String doctorContactInfo = doctorContactInfoController.text;
    String doctorWorkingHours = doctorWorkingHoursController.text;
    String doctorImage = selectedImage.toString();

    // Initialize doctor data source
    DoctorDataSource _doctorDataSource = DoctorDataSource();

    // Add doctor with details
    String result = await _doctorDataSource.addDoctor(
      doctorName: doctorName,
      doctorSpecialty: doctorSpecialty,
      doctorContactInfo: doctorContactInfo,
      doctorWorkingHours: doctorWorkingHours,
      doctorImage: doctorImage,

      // doctorImage: selectedImage, // Pass selected image
    );

    // Show result based on success or failure
    if (result == 'Post Created') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Doctor added successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Failed to add doctor. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Doctor'),
        backgroundColor: Colors.blue, // Set app bar color
        elevation: 4, // Add elevation for shadow effect
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Text form fields for doctor details
            TextFormField(
              controller: doctorNameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: doctorSpecialtyController,
              decoration: InputDecoration(
                labelText: 'Specialty',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: doctorContactInfoController,
              decoration: InputDecoration(
                labelText: 'Contact Information',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: doctorWorkingHoursController,
              decoration: InputDecoration(
                labelText: 'Working Hours',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Button to select image
            ElevatedButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    selectedImage = File(image.path);
                  });
                } else {
                  print('No image selected.');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 140, 166, 187), // Set button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Select Image'),
            ),

            const SizedBox(height: 16.0),

            // Button to submit form
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Set button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
