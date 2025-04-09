import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uba_doctor/Modules/Patient_Module/res/components/custom_button.dart';

class PrescribeMedicationPage extends StatelessWidget {
  const PrescribeMedicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController medicationController = TextEditingController();
    final TextEditingController dosageController = TextEditingController();
    final TextEditingController durationController = TextEditingController();

    Future<void> prescribeMedication() async {
      final name = nameController.text.trim();
      final medication = medicationController.text.trim();
      final dosage = dosageController.text.trim();
      final duration = durationController.text.trim();

      if (name.isNotEmpty &&
          medication.isNotEmpty &&
          dosage.isNotEmpty &&
          duration.isNotEmpty) {
        try {
          // Add the medication details to Firestore
          await FirebaseFirestore.instance
              .collection('patientDatas')
              .doc(name) // Use patient's name as the document ID
              .set({
            'name': name,
            'medication': medication,
            'dosage': dosage,
            'duration': duration,
          }, SetOptions(merge: true));

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Medication prescribed successfully!'),
              backgroundColor: Colors.green,
            ),
          );

          // Clear the fields after successful submission
          nameController.clear();
          medicationController.clear();
          dosageController.clear();
          durationController.clear();
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error prescribing medication: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please fill in all fields'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Prescribe Medication',
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Prescribe Medication',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Fill out the details below to prescribe medication to a patient.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                    controller: nameController,
                    label: 'Patient Name',
                    hint: 'Enter patient\'s full name'),
                const SizedBox(height: 15),
                _buildTextField(
                    controller: medicationController,
                    label: 'Medication Name',
                    hint: 'Enter the name of the medication'),
                const SizedBox(height: 15),
                _buildTextField(
                    controller: dosageController,
                    label: 'Dosage',
                    hint: 'e.g., 500mg'),
                const SizedBox(height: 15),
                _buildTextField(
                    controller: durationController,
                    label: 'Duration',
                    hint: 'e.g., 7 days'),
                const SizedBox(height: 30),
                Center(
                  child: CustomButton(
                    buttonText: 'Prescribe',
                    onTap: prescribeMedication,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method for text fields
  Widget _buildTextField(
      {required TextEditingController controller,
      required String label,
      required String hint}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
      ),
    );
  }
}
