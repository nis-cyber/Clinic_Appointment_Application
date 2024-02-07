import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/User/models/profile_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  _ProfilePageState createState() =>
      _ProfilePageState(); //just changes stateless to stateful and extends state class then commented to click file to open file
}

class _ProfilePageState extends State<ProfilePage> {
  void logout() {
    FirebaseAuth.instance.signOut();
  }
  // XFile? _selectedImage;

  // void setProfile() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  // setState(() {
  // _selectedImage = image }
  // );
  // }
  // }

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
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Column(children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/myimage.png'),
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
          const SizedBox(height: 20),

          const SizedBox(height: 35),
          ListTile(
            onTap: () {
              logout();
              // AuthService().signOut();
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            trailing: Icon(Icons.chevron_right),
          ),
          // ...List.generate(
          //   customListTiles.length,
          //       (index) => Card(
          //     elevation: 4,
          //     shadowColor: Colors.black12,
          //     child: ListTile(
          //       leading: Icon(customListTiles[index].icon),
          //       title: Text(customListTiles[index].title),
          //       trailing: Icon(Icons.chevron_right),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
