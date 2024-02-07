import 'package:flutter/material.dart';
import 'package:healthapp/User/pages/doctor_page.dart';
import 'package:healthapp/User/pages/notification_page.dart';
import 'package:healthapp/widgets/health_needs.dart';
import 'package:healthapp/widgets/nearby_doctor.dart';
import 'package:healthapp/widgets/upcoming_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final user = FirebaseAuth.instance.currentUser;
final name = user?.displayName ?? 'User';

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi, $name!"),
                Text(
                  'How are you feeling today?',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => NotificationPage()));
              },
              icon: const Icon(Ionicons.notifications_outline)),
          IconButton(
              onPressed: () {}, icon: const Icon(Ionicons.search_outline))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          //upcoming card
          const UpcomingCard(),

          const SizedBox(height: 20),
          Text(
            "Health Needs",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 15),
          //healths need
          const HealthNeeds(),
          const SizedBox(height: 30),

          //Nearby doctors
          ListTile(
            leading: Text(
              'Nearby Doctors',
              style: Theme.of(context).textTheme.headline6,
            ),
            trailing: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => DoctorPage()));
              },
              child: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
          ),
          const SizedBox(height: 15),
          const NearbyDoctors(),
        ],
      ),
    );
  }
}
