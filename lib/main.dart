import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthapp/features/auth/pages/status_page.dart';
import 'package:healthapp/models/bottom_nav_bar.dart';
import 'package:healthapp/pages/appointment_page.dart';
import 'package:healthapp/pages/home_page.dart';
import 'package:healthapp/pages/profile_page.dart';
import 'package:healthapp/pages/search_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(MyApp());
}

final GlobalKey<NavigatorState> globalNavigator = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1290, 2796),
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Clinic Appointment',
          theme: ThemeData(
            colorSchemeSeed: const Color(0xff5a73d8),
            textTheme: GoogleFonts.plusJakartaSansTextTheme(
                Theme.of(context).textTheme),
            useMaterial3: true,
          ),
          home: StatusPage(),
          navigatorKey: globalNavigator,
        );
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pages = [
    const HomePage(),
    const AppointmentPage(),
    const SearchScreen(),
    const ProfilePage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
