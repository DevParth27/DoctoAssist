import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uba_doctor/Main_home/Screens/roles/doctor_login.dart';
import 'package:uba_doctor/Main_home/Screens/roles/patient_login.dart';
import 'package:uba_doctor/Main_home/Screens/roles/pharmacy_login.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  String getCurrentDateTime() {
    final now = DateTime.now();
    final formatter = DateFormat('dd MMM yyyy • hh:mm a');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF77A53D), Color(0xFFBDE38C)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const AppTitle(),
                const SizedBox(height: 40),
                DateTimeDisplay(getCurrentDateTime()),
                const SizedBox(height: 80),
                const RoleSelectionPrompt(),
                const SizedBox(height: 40),
                const RoleButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'SVPCET Gram Arogya Seva App',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          'एसवीपीसीईटी ग्राम आरोग्य सेवा ऐप',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class DateTimeDisplay extends StatelessWidget {
  final String dateTime;

  const DateTimeDisplay(this.dateTime, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        border: Border.all(color: Colors.white, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.calendar_today, color: Colors.white, size: 18),
          const SizedBox(width: 10),
          Text(
            dateTime,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class RoleSelectionPrompt extends StatelessWidget {
  const RoleSelectionPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Please select your role to continue',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.8),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'कृपया सुरू ठेवण्यासाठी तुमची भूमिका निवडा',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.8),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class RoleButtons extends StatelessWidget {
  const RoleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: [
        RoleButton(
          title: 'Doctor / डॉक्टर',
          icon: Icons.local_hospital,
          destination: DoctorLogin(),
        ),
        RoleButton(
          title: 'Patient / पेशंट',
          icon: Icons.person,
          destination: PatientLogin(),
        ),
        RoleButton(
          title: 'Pharmacist / औषध पुरवठादार',
          icon: Icons.local_pharmacy,
          destination: PharmacyLogin(),
        ),
      ],
    );
  }
}

class RoleButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget destination;

  const RoleButton({
    super.key,
    required this.title,
    required this.icon,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [Color(0xFF4C8B1A), Color(0xFF77A53D)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(2, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
