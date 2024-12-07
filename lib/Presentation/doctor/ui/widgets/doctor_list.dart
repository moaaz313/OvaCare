import 'package:flutter/material.dart';

import 'doctor.dart';
import 'doctor_card.dart';

class DoctorList extends StatelessWidget {
  final List<Doctor> doctors;

  const DoctorList({required this.doctors, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return DoctorCard(doctor: doctors[index]);
      },
    );
  }
}