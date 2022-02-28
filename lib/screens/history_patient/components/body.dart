import 'package:flutter/material.dart';
import 'package:seizure_detection/components/socal_card.dart';
import 'package:seizure_detection/constants.dart';
import 'package:seizure_detection/size_config.dart';

import 'history_patient_form.dart';

class Body extends StatelessWidget {
  Body({Key? key, required this.counter}) : super(key: key);
  final int counter;
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
                Text("Patient Medicines", style: headingStyle),
                Text(
                  "Complete your history patient medicines",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                HistoryPatientForm(counter: counter),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
