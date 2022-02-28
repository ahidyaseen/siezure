import 'package:flutter/material.dart';
import 'package:seizure_detection/components/custom_surfix_icon.dart';
import 'package:seizure_detection/components/default_button.dart';
import 'package:seizure_detection/enums.dart';
import 'package:seizure_detection/screens/complete_profile/complete_profile_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class HistoryPatientForm extends StatefulWidget {
  HistoryPatientForm({Key? key, required this.counter}) : super(key: key);
  final int counter;
  @override
  _HistoryPatientFormState createState() => _HistoryPatientFormState();
}

class _HistoryPatientFormState extends State<HistoryPatientForm> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> answers = [];
  final List<String?> errors = [];
  Status? status;

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ...List.generate(
            widget.counter,
            (index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildFirstNameFormField(index),
                SizedBox(height: getProportionateScreenHeight(30)),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Daily?")),
                buildGenderFormField(index),
                SizedBox(height: getProportionateScreenHeight(30)),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          // FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          if (widget.counter != 0)
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // if all are valid then go to success screen
                  Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                }
              },
            ),
          SizedBox(height: getProportionateScreenHeight(40)),
        ],
      ),
    );
  }

  TextFormField buildFirstNameFormField(index) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      // onSaved: (newValue) => answers[index]['name'] = newValue,
      decoration: InputDecoration(
        labelText: "Medicine Name",
        hintText: "Enter Medicine Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User Icon.svg"),
      ),
    );
  }

  buildGenderFormField(index) {
    return Column(
      children: [
        ListTile(
          title: const Text('Yes'),
          leading: Radio<Status>(
            value: Status.yes,
            groupValue: status,
            onChanged: (Status? value) {
              setState(() {
                // answers[index]['status'] = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No'),
          leading: Radio<Status>(
            value: Status.no,
            groupValue: status,
            onChanged: (Status? value) {
              setState(() {
                status = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
