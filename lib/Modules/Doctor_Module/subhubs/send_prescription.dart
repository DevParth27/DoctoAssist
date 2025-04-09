import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uba_doctor/Modules/Patient_Module/res/components/custom_button.dart';

class SendPrescriptionPage extends StatefulWidget {
  const SendPrescriptionPage({super.key});

  @override
  _SendPrescriptionPageState createState() => _SendPrescriptionPageState();
}

class _SendPrescriptionPageState extends State<SendPrescriptionPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _prescriptionController = TextEditingController();

  // Function to send prescription
  Future<void> _sendPrescription() async {
    final email = _emailController.text.trim();
    final prescription = _prescriptionController.text.trim();

    if (email.isEmpty || prescription.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // Save prescription to Firestore
      await FirebaseFirestore.instance.collection('prescriptions').add({
        'email': email,
        'prescription': prescription,
        'timestamp': DateTime.now(),
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Prescription sent successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      // Clear the fields after successful submission
      _emailController.clear();
      _prescriptionController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error sending prescription: $e'),
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
          'Send Prescription',
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
                  'Send Prescription to Patient',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700]),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Enter the details below to send the prescription to the patient.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                // Patient Email TextField
                _buildTextField(
                  controller: _emailController,
                  label: 'Patient Email',
                  hint: 'Enter patient\'s email address',
                ),
                const SizedBox(height: 15),
                // Prescription Details TextField
                _buildTextField(
                  controller: _prescriptionController,
                  label: 'Prescription Details',
                  hint: 'Enter prescription details here...',
                  maxLines: 5,
                ),
                const SizedBox(height: 30),
                // Send Button
                Center(
                  child: CustomButton(
                    buttonText: 'Send',
                    onTap: _sendPrescription,
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
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
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
    _emailController.dispose();
    _prescriptionController.dispose();
    super.dispose();
  }
}
