import 'package:flutter/material.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Details'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.near_me,
          color: Colors.white,
          size: 22.5,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xffF9F9F9),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/doctor_1.jpg'),
                      radius: 30,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Dr. Pitambar Thakur',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff1E1C61),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Gerneral Physician',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xff1E1C61).withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          'MD',
                          style: TextStyle(
                            color: Color(0xff1E1C61).withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          'BNC Hospital',
                          style: TextStyle(
                            color: Color(0xff1E1C61).withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Speaks - ",
                              style: TextStyle(
                                color: Color(0xff1E1C61).withOpacity(0.7),
                              ),
                            ),
                            const Text(
                              'English',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'About Doctor',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xff1E1C61),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'We need to Talk about doctor here ',
                  style: TextStyle(
                    height: 1.6,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1E1C61).withOpacity(0.7),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Upcoming Schedule',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xff1E1C61),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'Today',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xff1E1C61),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                //Upcoming schedule
                //Book appointment
                ElevatedButton(
                  child: const Text('Book Appointment'),
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
