import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uba_doctor/Modules/Patient_Module/consts/colors.dart';
import 'package:uba_doctor/Modules/Patient_Module/consts/consts.dart';
import 'package:uba_doctor/Modules/Patient_Module/consts/fonts.dart';
import 'package:uba_doctor/Modules/Patient_Module/res/components/custom_button.dart';
import 'package:uba_doctor/Modules/new_PatientModule/RES/custom_text.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  // Controllers for the input fields
  final TextEditingController _appointmentDayController =
      TextEditingController();
  final TextEditingController _appointmentTimeController =
      TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _bookAppointment() async {
    String appointmentDay = _appointmentDayController.text.trim();
    String appointmentTime = _appointmentTimeController.text.trim();
    String mobileNumber = _mobileNumberController.text.trim();
    String fullName = _fullNameController.text.trim();
    String message = _messageController.text.trim();

    // Validate that all fields are filled
    if (appointmentDay.isEmpty ||
        appointmentTime.isEmpty ||
        mobileNumber.isEmpty ||
        fullName.isEmpty ||
        message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in all fields (कृपया सर्व फील्ड भरा)"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // Save data to Firestore
      await FirebaseFirestore.instance.collection('PatientDetails').add({
        'appointmentDay': appointmentDay,
        'appointmentTime': appointmentTime,
        'mobileNumber': mobileNumber,
        'fullName': fullName,
        'message': message,
        'timestamp': DateTime.now(), // Optional: To sort by booking time
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              "Appointment booked successfully! (अपॉइंटमेंट यशस्वीरीत्या बुक झाली!)"),
          backgroundColor: Colors.green,
        ),
      );

      // Clear the fields
      _appointmentDayController.clear();
      _appointmentTimeController.clear();
      _mobileNumberController.clear();
      _fullNameController.clear();
      _messageController.clear();
    } catch (e) {
      // Handle Firestore errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        backgroundColor: AppColors.navcolor,
        elevation: 0.0,
        title: AppStyles.bold(
          title: "Make your Appointment (अपॉइंटमेंट बुक करा)",
          size: AppSizes.size18,
          color: AppColors.whiteColor,
        ),
      ),
      body: Container(
        color: Colors.green.shade50, // Solid green background
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Appointment Day
                    AppStyles.bold(
                      title: "Select Appointment Day (अपॉइंटमेंट दिवस निवडा)",
                      size: AppSizes.size16,
                    ),
                    8.heightBox,
                    CustomTextField(
                      hint: "Select Day (दिवस निवडा)",
                      controller: _appointmentDayController,
                    ),
                    16.heightBox,

                    // Appointment Time
                    AppStyles.bold(
                      title: "Select Appointment Time (अपॉइंटमेंट वेळ निवडा)",
                      size: AppSizes.size16,
                    ),
                    8.heightBox,
                    CustomTextField(
                      hint: "Select Time Slot (वेळ निवडा)",
                      controller: _appointmentTimeController,
                    ),
                    16.heightBox,

                    // Mobile Number
                    AppStyles.bold(
                      title: "Mobile Number (मोबाईल क्रमांक)",
                      size: AppSizes.size16,
                    ),
                    8.heightBox,
                    CustomTextField(
                      hint:
                          "Enter your Mobile Number (तुमचा मोबाईल क्रमांक लिहा)",
                      controller: _mobileNumberController,
                    ),
                    16.heightBox,

                    // Full Name
                    AppStyles.bold(
                      title: "Full Name (पूर्ण नाव)",
                      size: AppSizes.size16,
                    ),
                    8.heightBox,
                    CustomTextField(
                      hint: "Enter Patient's Name (रुग्णाचे नाव लिहा)",
                      controller: _fullNameController,
                    ),
                    16.heightBox,

                    // Message
                    AppStyles.bold(
                      title: "Message (संदेश)",
                      size: AppSizes.size16,
                    ),
                    8.heightBox,
                    CustomTextField(
                      hint: "Enter your message (तुमचा संदेश लिहा)",
                      controller: _messageController,
                    ),
                    24.heightBox,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          buttonText: "Book Appointment (अपॉइंटमेंट बुक करा)",
          onTap: _bookAppointment,
        ),
      ),
    );
  }
}
