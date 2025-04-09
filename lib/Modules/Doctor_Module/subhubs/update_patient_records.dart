import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uba_doctor/Modules/Patient_Module/res/components/custom_button.dart';

class UpdatePatientRecordsPage extends StatefulWidget {
  const UpdatePatientRecordsPage({super.key});

  @override
  _UpdatePatientRecordsPageState createState() =>
      _UpdatePatientRecordsPageState();
}

class _UpdatePatientRecordsPageState extends State<UpdatePatientRecordsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _conditionController = TextEditingController();
  final TextEditingController _medicationController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  // Firestore update function
  Future<void> _updatePatientRecord({
    required String name,
    required String updatedCondition,
    required String medication,
    required String dosage,
    required String duration,
  }) async {
    try {
      // Access the Firestore collection
      final patientDoc =
          FirebaseFirestore.instance.collection('patientDatas').doc(name);

      // Check if the document exists
      final docSnapshot = await patientDoc.get();

      if (docSnapshot.exists) {
        // Update the document with new data
        await patientDoc.update({
          'description': updatedCondition,
          'medication': medication,
          'dosage': dosage,
          'duration': duration,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Successfully updated record for $name'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // Show error if the record doesn't exist
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No record found for $name'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating record: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Patient Records',
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
                  'Update Patient Record Details',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700]),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Enter the patient\'s details to update their record.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                // Patient Name TextField
                _buildTextField(
                  controller: _nameController,
                  label: 'Patient Name',
                  hint: 'Enter patient\'s name',
                ),
                const SizedBox(height: 15),
                // Condition TextField
                _buildTextField(
                  controller: _conditionController,
                  label: 'Condition',
                  hint: 'Enter the patient\'s condition',
                ),
                const SizedBox(height: 15),
                // Medication Name TextField
                _buildTextField(
                  controller: _medicationController,
                  label: 'Medication Name',
                  hint: 'Enter the medication name',
                ),
                const SizedBox(height: 15),
                // Dosage TextField
                _buildTextField(
                  controller: _dosageController,
                  label: 'Dosage',
                  hint: 'Enter the dosage (e.g., 500mg)',
                ),
                const SizedBox(height: 15),
                // Duration TextField
                _buildTextField(
                  controller: _durationController,
                  label: 'Duration',
                  hint: 'Enter the duration (e.g., 7 days)',
                ),
                const SizedBox(height: 30),
                // Update Button
                Center(
                  child: CustomButton(
                    buttonText: 'Update',
                    onTap: () {
                      final name = _nameController.text.trim();
                      final updatedCondition = _conditionController.text.trim();
                      final medication = _medicationController.text.trim();
                      final dosage = _dosageController.text.trim();
                      final duration = _durationController.text.trim();

                      if (name.isNotEmpty &&
                          updatedCondition.isNotEmpty &&
                          medication.isNotEmpty &&
                          dosage.isNotEmpty &&
                          duration.isNotEmpty) {
                        _updatePatientRecord(
                          name: name,
                          updatedCondition: updatedCondition,
                          medication: medication,
                          dosage: dosage,
                          duration: duration,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill in all fields'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
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
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
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

  @override
  void dispose() {
    _nameController.dispose();
    _conditionController.dispose();
    _medicationController.dispose();
    _dosageController.dispose();
    _durationController.dispose();
    super.dispose();
  }
}
