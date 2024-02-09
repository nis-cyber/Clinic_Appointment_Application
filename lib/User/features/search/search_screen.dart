import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<Map<String, dynamic>> updatedList;
  late List<Map<String, dynamic>> doctors;

  @override
  void initState() {
    super.initState();
    doctors = [
      {
        "name": "Dr. Kamala Mai",
        "specialty": "General Practitioner",
        "contactInfo": "123-456-7890",
        "workingHours": "9:00 AM - 5:00 PM",
      },
      {
        "name": "Dr. Shree Krishna",
        "specialty": "Dentist",
        "contactInfo": "123-456-7890",
        "workingHours": "9:00 AM - 5:00 PM",
      },
      {
        "name": "Dr. Sambhu Prasad",
        "specialty": "Cardiologist",
        "contactInfo": "123-456-7890",
        "workingHours": "9:00 AM - 5:00 PM",
      },
    ];
    updatedList = List.from(doctors);
  }

  void upDatelist(String value) {
    setState(() {
      updatedList = doctors.where((doctor) {
        final doctorName = doctor["name"].toString().toLowerCase();
        final doctorSpecialty = doctor["specialty"].toString().toLowerCase();
        final searchValue = value.toLowerCase();
        return doctorName.contains(searchValue) ||
            doctorSpecialty.contains(searchValue);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(155, 95, 138, 238),
      appBar: AppBar(elevation: 0.0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search for a doctor',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => upDatelist(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 102, 117, 231),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg. General Practitioner",
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: updatedList.isEmpty
                  ? const Center(
                      child: Text(
                        'No doctors found',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: updatedList.length,
                      itemBuilder: (context, index) {
                        final doctor = updatedList[index];
                        return Card(
                          child: ListTile(
                            title: Text(doctor["name"].toString()),
                            subtitle: Text(doctor["specialty"].toString()),
                            trailing: IconButton(
                              icon: const Icon(Icons.arrow_forward_ios),
                              onPressed: () {},
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
