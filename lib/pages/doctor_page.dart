import 'package:flutter/material.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.near_me,
          color: Colors.white,
          size: 22.5,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffF9F9F9),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/doctor_1.jpg'),
                      radius: 30,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Dr. Pitambar Thakur',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xff1E1C61),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Lets add about the doctor speciality here jhgjhg jhgjhg jgjhg jhgjhg jhgjhg jhgjhg jhgjhg',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xff1E1C61).withOpacity(0.7),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'MD',
                            style: TextStyle(
                              color: Color(0xff1E1C61).withOpacity(0.7),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'BNC Hospital',
                            style: TextStyle(
                              color: Color(0xff1E1C61).withOpacity(0.7),
                            ),
                          ),
                          SizedBox(
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
                              Text(
                                'English',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'About Doctor',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xff1E1C61),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'We need to add about doctor here',
                  style: TextStyle(
                    height: 1.6,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1E1C61).withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Upcoming Schedule',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xff1E1C61),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '28th May, 2021',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xff1E1C61).withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height : 2,
                ),
                //Upcoming schedule

                //Book appointment
                ElevatedButton(
                  child: Text('Book Appointment'),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 2,
                ),




                //Back button
                ElevatedButton(
                  child: Text('Back'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
