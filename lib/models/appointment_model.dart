// models/appointment_model.dart
class AppointmentModel {
  final String id; // Unique identifier for the appointment
  final String patientId; // ID of the patient who booked the appointment
  final String doctorId; // ID of the doctor the appointment is with
  final DateTime appointmentDateTime; // Date and time of the appointment
  final AppointmentStatus status; // Status of the appointment

  AppointmentModel({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.appointmentDateTime,
    required this.status,
  });
}

// Enum to represent the status of the appointment
enum AppointmentStatus {
  scheduled,
  completed,
  canceled,
  // Add more status options as needed
}
