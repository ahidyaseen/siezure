import 'package:flutter/material.dart';

import 'components/body.dart';

class PatientInformationScreen extends StatelessWidget {
  static String routeName = "/patient_information";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Information"),
      ),
      body: Body(),
    );
  }
}
