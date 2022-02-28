import 'package:flutter/material.dart';
import 'package:seizure_detection/screens/history_patient/history_patient_screen.dart';
import 'package:seizure_detection/screens/login_success/login_success_screen.dart';
import 'package:seizure_detection/screens/patient_information/patient_information_screen.dart';
import 'package:seizure_detection/screens/sign_in/sign_in_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Patient Information",
            icon: "assets/icons/User Icon.svg",
            press: () => Navigator.pushNamed(
              context,
              PatientInformationScreen.routeName,
            ),
          ),
          ProfileMenu(
            text: "Report",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "History Patient",
            icon: "assets/icons/Settings.svg",
            press: () => Navigator.pushNamed(
              context,
              HistoryPatientScreen.routeName,
            ),
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () => Navigator.pushNamedAndRemoveUntil(context,
                SignInScreen.routeName, (Route<dynamic> route) => false),
          ),
        ],
      ),
    );
  }
}
