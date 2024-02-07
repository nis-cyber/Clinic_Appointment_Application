class DoctorDataModel {
  final String name;
  final String specialty;
  final String contactInfo;
  final String workingHours;

  DoctorDataModel({
    required this.name,
    required this.specialty,
    required this.contactInfo,
    required this.workingHours,
  });

  factory DoctorDataModel.fromMap(Map<String, dynamic> map) {
    return DoctorDataModel(
      name: map['name'],
      specialty: map['specialty'],
      contactInfo: map['contactInfo'],
      workingHours: map['workingHours'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'specialty': specialty,
      'contactInfo': contactInfo,
      'workingHours': workingHours,
    };
  }
}
