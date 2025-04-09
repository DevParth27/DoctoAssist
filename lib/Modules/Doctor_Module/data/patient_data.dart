import 'package:cloud_firestore/cloud_firestore.dart';

class PatientData {
  final String name;
  final String description;

  PatientData({
    required this.name,
    required this.description,
  });
}

List<PatientData> patientDatas = [
  PatientData(
    name: 'Shreeja Naik',
    description: 'Heart Patient',
  ),
];

void addPatientDataToFirestore() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  for (var item in patientDatas) {
    try {
      await firestore.collection('patientDatas').doc(item.name).set({
        'name': item.name,
        'description': item.description,
      });
      print('Added ${item.name} to Firestore');
    } catch (e) {
      print('Error adding ${item.name} to Firestore: $e');
    }
  }
}
