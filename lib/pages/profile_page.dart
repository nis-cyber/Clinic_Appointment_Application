import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "PROFILE",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.settings_outlined),
          )
        ],
      ),
      body: (ListView(padding: const EdgeInsets.all(10), children: [
        Column(children: const [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/bishal.jpeg'),
          ),
          SizedBox(height: 10),
          Text(
            "Nishant",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text("Patient"),
          SizedBox(
            height: 30,
          ),
        ]),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                "Complete Your profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              "(1/5)",
              style: TextStyle(color: Color.fromARGB(255, 31, 118, 180)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: List.generate(5, (index) {
            return Expanded(
              child: Container(
                height: 7,
                margin: EdgeInsets.only(right: index == 4 ? 0 : 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == 0 ? Colors.blue : Colors.black12),
              ),
            );
          }),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final card = profileCompletionCards[index];
                return SizedBox(
                  width: 160,
                  child: Card(
                    // ignore: sort_child_properties_last
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          card.icon,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        card.title,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        // ignore: sort_child_properties_last
                        child: Text(
                          card.buttonText,
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                      )
                    ]),
                    shadowColor: Colors.black,
                  ),
                );
              },
              separatorBuilder: (context, index) =>
              const Padding(padding: EdgeInsets.only(right: 5)),
              itemCount: profileCompletionCards.length),
        ),
        const SizedBox(height: 35),
        ...List.generate(
            customListTiles.length,

            // ignore: prefer_const_constructors
                (index) => Card(
              elevation: 4,
              shadowColor: Colors.black12,
              child: const ListTile(
                leading: Icon(Icons.notification_add),
                title: Text("Notifications"),
                trailing: Icon(Icons.chevron_right),
              ),
            ))
      ])),
    );
  }
}

class ProfileCompletionCard {
  final String title;
  final String buttonText;
  final IconData icon;

  ProfileCompletionCard({
    required this.title,
    required this.buttonText,
    required this.icon,
  });
}

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    title: "Set Your Profile Picture",
    icon: CupertinoIcons.person_circle,
    buttonText: "Continue",
  ),
  ProfileCompletionCard(
    title: "Upload Your Resume",
    icon: CupertinoIcons.doc,
    buttonText: "Upload",
  ),
  ProfileCompletionCard(
    title: "Add your Skills",
    icon: CupertinoIcons.square_list,
    buttonText: "Add",
  )
];

class CustomListTile {
  final IconData icon;
  final String title;
  CustomListTile({
    required this.icon,
    required this.title,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(icon: Icons.insights, title: "Activity"),
  CustomListTile(icon: Icons.location_on_outlined, title: "Location"),
  CustomListTile(icon: CupertinoIcons.bell, title: "Notifications"),
  CustomListTile(icon: CupertinoIcons.arrow_right_arrow_left, title: "Logout ")
];
