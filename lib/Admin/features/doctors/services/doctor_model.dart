class DoctorDataModel {
  final String name;
  final String specialty;
  final String contactInfo;
  final String workingHours;
  final String doctorImage; // Define the missing variable here

  DoctorDataModel({
    required this.name,
    required this.specialty,
    required this.contactInfo,
    required this.workingHours,
    required this.doctorImage, // Add the missing variable here
  });

  factory DoctorDataModel.fromJson(Map<String, dynamic> json) {
    return DoctorDataModel(
      name: json['name'],
      specialty: json['specialty'],
      contactInfo: json['contactInfo'],
      workingHours: json['workingHours'],
      doctorImage: json['doctorImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialty': specialty,
      'contactInfo': contactInfo,
      'workingHours': workingHours,
      'doctorImage': doctorImage,
    };
  }
}
