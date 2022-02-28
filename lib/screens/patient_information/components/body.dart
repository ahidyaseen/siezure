import 'package:flutter/material.dart';
import 'package:seizure_detection/components/socal_card.dart';
import 'package:seizure_detection/constants.dart';
import 'package:seizure_detection/size_config.dart';

import 'patient_information_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("Patient Information", style: headingStyle),
                Text(
                  "Complete your details",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                PatientInformationForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
