import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uba_doctor/Modules/Doctor_Module/subhubs/addPatients.dart';
import 'package:uba_doctor/Modules/Doctor_Module/subhubs/notifications.dart';
import 'package:uba_doctor/Modules/Doctor_Module/subhubs/prescribe_medication.dart';
import 'package:uba_doctor/Modules/Doctor_Module/subhubs/recent_appoints.dart';
import 'package:uba_doctor/Modules/Doctor_Module/subhubs/send_prescription.dart';
import 'package:uba_doctor/Modules/Doctor_Module/subhubs/update_patient_records.dart';
import 'package:uba_doctor/Modules/Doctor_Module/subhubs/view_patient_records.dart';
import 'package:uba_doctor/Modules/Patient_Module/res/components/custom_button.dart';

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen dimensions for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final isTabletOrLarger = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Doctor Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GridView.count(
                crossAxisCount: isTabletOrLarger ? 3 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio:
                    constraints.maxWidth / (constraints.maxHeight / 1.5),
                children: [
                  _buildDashboardCard(
                    context,
                    title: 'Prescribe Medication',
                    icon: Icons.medical_services,
                    color: Colors.blue.shade700,
                    page: const PrescribeMedicationPage(),
                  ),
                  _buildDashboardCard(
                    context,
                    title: 'Send Prescription',
                    icon: Icons.send,
                    color: Colors.green.shade700,
                    page: const SendPrescriptionPage(),
                  ),
                  _buildDashboardCard(
                    context,
                    title: 'View Patient Records',
                    icon: Icons.folder_open,
                    color: Colors.purple.shade700,
                    page: const ViewPatientRecordsPage(),
                  ),
                  _buildDashboardCard(
                    context,
                    title: 'Update Patient Records',
                    icon: Icons.edit,
                    color: Colors.orange.shade700,
                    page: const UpdatePatientRecordsPage(),
                  ),
                  _buildDashboardCard(
                    context,
                    title: 'Add Patient',
                    icon: Icons.person_add,
                    color: Colors.teal.shade700,
                    page: const AddPatientPage(),
                  ),
                  _buildDashboardCard(
                    context,
                    title: 'View Recent Appointments',
                    icon: Icons.calendar_today,
                    color: Colors.indigo.shade700,
                    page: const RecentAppointments(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          buttonText: "Doctor Availability",
          onTap: () {
            // Open Doctor Availability Popup
            showDialog(
              context: context,
              builder: (context) => const DoctorAvailabilityDialog(),
            );
          },
        ),
      ),
    );
  }

  // Helper widget to create a card for the dashboard
  Widget _buildDashboardCard(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required Widget page}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.1), color.withOpacity(0.3)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: color,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorAvailabilityDialog extends StatefulWidget {
  const DoctorAvailabilityDialog({super.key});

  @override
  State<DoctorAvailabilityDialog> createState() =>
      _DoctorAvailabilityDialogState();
}

class _DoctorAvailabilityDialogState extends State<DoctorAvailabilityDialog> {
  final TextEditingController _doctorNameController = TextEditingController();
  final TextEditingController _startOfShiftController = TextEditingController();
  final TextEditingController _endOfShiftController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  Future<void> _saveDoctorAvailability() async {
    String doctorName = _doctorNameController.text.trim();
    String startOfShift = _startOfShiftController.text.trim();
    String endOfShift = _endOfShiftController.text.trim();
    String date = _dateController.text.trim();

    // Validate that all fields are filled
    if (doctorName.isEmpty ||
        startOfShift.isEmpty ||
        endOfShift.isEmpty ||
        date.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in all fields"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Validate time format (HH:mm)
    final timeRegex = RegExp(r'^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$');
    if (!timeRegex.hasMatch(startOfShift)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid start time format. Use HH:mm"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (!timeRegex.hasMatch(endOfShift)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid end time format. Use HH:mm"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Validate date format (YYYY-MM-DD)
    final dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!dateRegex.hasMatch(date)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid date format. Use YYYY-MM-DD"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // Create a unique ID for the document
      final uniqueId = '${doctorName}_${date}_${startOfShift}_$endOfShift';

      // Check if the document already exists
      final docRef = FirebaseFirestore.instance
          .collection('doctorAvailability')
          .doc(uniqueId);

      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        // Document already exists, update it
        await docRef.update({
          'timestamp': DateTime.now(), // Update the timestamp
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Doctor availability updated successfully!"),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // Document does not exist, add a new one
        await docRef.set({
          'doctorName': doctorName,
          'startOfShift': startOfShift,
          'endOfShift': endOfShift,
          'date': date,
          'timestamp': DateTime.now(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Doctor availability saved successfully!"),
            backgroundColor: Colors.green,
          ),
        );
      }

      // Close the dialog
      Navigator.pop(context);
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
    return AlertDialog(
      title: const Text(
        "Doctor Availability",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _doctorNameController,
              decoration: const InputDecoration(
                labelText: "Doctor Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _startOfShiftController,
              decoration: const InputDecoration(
                labelText: "Start of Shift (HH:mm)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _endOfShiftController,
              decoration: const InputDecoration(
                labelText: "End of Shift (HH:mm)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: "Date (YYYY-MM-DD)",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: _saveDoctorAvailability,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade700,
          ),
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
