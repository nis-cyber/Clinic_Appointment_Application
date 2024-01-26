import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Import this if you are using CupertinoIcons

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
    icon: Icons.person,
    buttonText: "Continue",
  ),
  ProfileCompletionCard(
    title: "Upload Your Document",
    icon: Icons.description,
    buttonText: "Upload",
  ),
  ProfileCompletionCard(
    title: "Add Your Personal Information",
    icon: Icons.info,
    buttonText: "Add",
  ),
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
  CustomListTile(icon: Icons.notifications, title: "Notifications"),
  CustomListTile(icon: Icons.logout, title: "Logout"),
];
