import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uba_doctor/Main_home/Screens/splash_screen.dart';
import 'package:uba_doctor/Modules/Doctor_Module/data/patient_data.dart';
import 'package:uba_doctor/Modules/Pharmacy_Module/data/medicines.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  addMedicinedItemsToFirestore();
  addPatientDataToFirestore();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'User Flow App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Splash(),
    );
  }
}
