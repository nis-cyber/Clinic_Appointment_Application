import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/doctor_model.dart';
// class MessagePage extends StatelessWidget {
//   const MessagePage({super.key});

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<String> searchHistory = []; // Manage search history
  List<DoctorModel> doctorList = []; // Manage the list of doctors

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: (query) {
            // Implement dynamic search (e.g., debouncing/throttling)
            // Update UI or fetch data based on the search query
          },
          decoration: InputDecoration(
            hintText: 'Search for doctors',
          ),
        ),
      ),
      body: Column(
        children: [
          // Display search history
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Search History', style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                // Display search history using ListView or other widgets
                // Use ListTile or other widgets to show each search history entry
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: searchHistory.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(searchHistory[index]),
                      onTap: () {
                        // Handle tapping on a search history item
                        // You may want to set the search query and fetch data
                        _searchController.text = searchHistory[index];
                        // Fetch and display doctor list based on the selected search history
                        fetchDoctorList(searchHistory[index]);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          // Display the list of doctors
          Expanded(
            child: ListView.builder(
              itemCount: doctorList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(doctorList[index].name),
                  // Add more information or actions related to the doctor
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Fetch doctor list based on the search query
  void fetchDoctorList(String query) {
    // Implement your logic to fetch the doctor list based on the search query
    // Update the 'doctorList' and the UI accordingly
  }
}




