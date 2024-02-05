import 'package:flutter/material.dart';

class ClinicHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clinic Home Screen '),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorsSection(),
            SizedBox(height: 16.0),
            UpcomingQueueSection(),
            SizedBox(height: 16.0),
            MissedQueueSection(),
            SizedBox(height: 16.0),
            CheckoutSection(),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class DoctorsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey[200]!, Colors.grey[400]!],
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          SectionHeader('Doctors'),
          DoctorCard('Dr. Ram Baran Yadav', 'Available', 'Patient: Nishant'),
          DoctorCard('Dr. Nana Patekar', 'Busy', 'Patient: Bishal'),
        ],
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String status;
  final String patient;

  DoctorCard(this.name, this.status, this.patient);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Status: $status'),
            Text('Patient: $patient'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                // Cancel Consultation action
              },
            ),
            IconButton(
              icon: Icon(Icons.access_alarm),
              onPressed: () {
                // Absent action
              },
            ),
            IconButton(
              icon: Icon(Icons.done),
              onPressed: () {
                // Complete Consultation action
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UpcomingQueueSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey[200]!, Colors.grey[400]!],
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          SectionHeader('Upcoming Queue'),
          QueueItem('ID123', 'John Doe', 'A001', 'Male', 'In Queue'),
          QueueItem('ID124', 'Jane Smith', 'A002', 'Female', 'In Queue'),
        ],
      ),
    );
  }
}

class QueueItem extends StatelessWidget {
  final String identityNumber;
  final String name;
  final String queueNumber;
  final String gender;
  final String presenceStatus;

  QueueItem(
    this.identityNumber,
    this.name,
    this.queueNumber,
    this.gender,
    this.presenceStatus,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text('ID: $identityNumber - $name'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Queue Number: $queueNumber'),
            Text('Gender: $gender'),
            Text('Status: $presenceStatus'),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            // Cancel Queue action
          },
        ),
      ),
    );
  }
}

class MissedQueueSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey[200]!, Colors.grey[400]!],
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          SectionHeader('Missed Queue'),
          MissedQueueItem('ID125', 'Mike Johnson', 'Male'),
        ],
      ),
    );
  }
}

class MissedQueueItem extends StatelessWidget {
  final String identityNumber;
  final String name;
  final String gender;

  MissedQueueItem(this.identityNumber, this.name, this.gender);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text('ID: $identityNumber - $name'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gender: $gender'),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            // Rejoin Queue action
          },
        ),
      ),
    );
  }
}

class CheckoutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey[200]!, Colors.grey[400]!],
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          SectionHeader('Checkout'),
          CheckoutItem(
            'Mary Johnson',
            'ID123',
            'A001',
            'Female',
            'Prescription: Aspirin',
            '\$50.00',
            'Paid',
          ),
        ],
      ),
    );
  }
}

class CheckoutItem extends StatelessWidget {
  final String name;
  final String identityNumber;
  final String queueNumber;
  final String gender;
  final String prescription;
  final String cost;
  final String paymentStatus;

  CheckoutItem(
    this.name,
    this.identityNumber,
    this.queueNumber,
    this.gender,
    this.prescription,
    this.cost,
    this.paymentStatus,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text('ID: $identityNumber - $name'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Queue Number: $queueNumber'),
            Text('Gender: $gender'),
            Text('Prescription: $prescription'),
            Text('Cost: $cost'),
            Text('Payment Status: $paymentStatus'),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            // Cancel Checkout action
          },
        ),
      ),
    );
  }
}
