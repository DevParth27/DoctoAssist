import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uba_doctor/Modules/Doctor_Module/doctor_Dashboard.dart';

class DoctorLogin extends StatefulWidget {
  const DoctorLogin({super.key});

  @override
  State<DoctorLogin> createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), // Light blue background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.04),
              SizedBox(
                height: 150,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/assets_main/photos/normal/doctor_splash.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: height * 0.08),
              Text(
                "Welcome, Doctor!",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700]),
              ),
              const SizedBox(height: 8),
              const Text(
                "Simplify Your Medical Practice with MedxPharmacy",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 35),
              Column(
                children: [
                  _buildSocialButton(
                    iconPath: 'assets/assets_main/photos/svgs/google.svg',
                    text: 'Sign in with Google',
                    onPressed: () async {
                      _showSnackBar('Google Login Coming Soon!');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorDashboard(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildSocialButton(
                    iconPath: 'assets/assets_main/photos/svgs/phone.svg',
                    text: 'Sign in with Phone',
                    onPressed: () {
                      _showSnackBar('Phone Login Coming Soon!');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorDashboard(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 38),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Icon(Icons.medical_services,
                          size: 40, color: Colors.blue[700]),
                      const SizedBox(height: 10),
                      const Text(
                        "Manage Your Patients and Schedule Easily",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Access patient records, prescribe medications, and manage appointments all in one place.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                '© 2024 MedxPharmacy. All rights reserved.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required String iconPath,
    required String text,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          height: 60,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconPath,
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 12),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
