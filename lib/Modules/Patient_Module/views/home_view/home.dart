import 'package:flutter/material.dart';
import 'package:uba_doctor/Modules/Patient_Module/consts/colors.dart';
import 'package:uba_doctor/Modules/Patient_Module/views/home_view/home_view.dart';
import 'package:uba_doctor/Modules/Patient_Module/views/login_view/login_view.dart';
import 'package:uba_doctor/Modules/Patient_Module/views/settings_view/settings_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List screenlist = [
    const HomeView(),
    const Loginview(),
    const SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenlist.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white.withOpacity(0.65),
          selectedItemColor: AppColors.whiteColor,
          selectedLabelStyle: TextStyle(color: AppColors.whiteColor),
          selectedIconTheme: IconThemeData(color: AppColors.whiteColor),
          backgroundColor: AppColors.navcolor,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined), label: 'Sessions'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Doctor'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}
