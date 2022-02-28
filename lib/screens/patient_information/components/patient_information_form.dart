import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seizure_detection/components/custom_surfix_icon.dart';
import 'package:seizure_detection/components/default_button.dart';
import 'package:seizure_detection/components/form_error.dart';
import 'package:seizure_detection/enums.dart';
import 'package:seizure_detection/screens/complete_profile/complete_profile_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class PatientInformationForm extends StatefulWidget {
  @override
  _PatientInformationFormState createState() => _PatientInformationFormState();
}

class _PatientInformationFormState extends State<PatientInformationForm> {
  final _formKey = GlobalKey<FormState>();
  String? firstName;
  String? lastName;
  String? nationalId;
  String? height;
  String? width;
  Gender? gender;
  // String? age;
  TextEditingController age = TextEditingController(
      text: '${DateFormat('yyyy-MM-dd').format(DateTime.now())}');
  final List<String?> errors = [];

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
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildNationalIDFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildHeightFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildWidthFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildGenderFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAgeFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          // FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
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

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => firstName = newValue,
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User Icon.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User Icon.svg"),
      ),
    );
  }

  TextFormField buildNationalIDFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => nationalId = newValue,
      decoration: InputDecoration(
        labelText: "National ID",
        hintText: "Enter your national id",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User Icon.svg"),
      ),
    );
  }

  TextFormField buildHeightFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => height = newValue,
      decoration: InputDecoration(
        labelText: "Height",
        hintText: "Enter your height",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User Icon.svg"),
      ),
    );
  }

  TextFormField buildWidthFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => width = newValue,
      decoration: InputDecoration(
        labelText: "Width",
        hintText: "Enter your width",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User Icon.svg"),
      ),
    );
  }

  buildGenderFormField() {
    return Column(
      children: [
        ListTile(
          title: const Text('Male'),
          leading: Radio<Gender>(
            value: Gender.male,
            groupValue: gender,
            onChanged: (Gender? value) {
              setState(() {
                gender = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Female'),
          leading: Radio<Gender>(
            value: Gender.female,
            groupValue: gender,
            onChanged: (Gender? value) {
              setState(() {
                gender = value;
              });
            },
          ),
        ),
      ],
    );
  }

  TextFormField buildAgeFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      // onSaved: (newValue) => age = newValue,
      // initialValue: '${DateFormat('yyyy-MM-dd').format(DateTime.now())}',
      controller: age, //editing controller of this TextField
      readOnly: true, //set it true, so that user will not able to edit text
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(
                1900), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          print(
              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          print(
              formattedDate); //formatted date output using intl package =>  2021-03-16
          //you can implement different kind of Date Format here according to your requirement

          setState(() {
            age.text = formattedDate; //set output date to TextField value.
          });
        } else {
          print("Date is not selected");
        }
      },
      decoration: InputDecoration(
        labelText: "Age",
        hintText: "Enter your age",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User Icon.svg"),
      ),
    );
  }
}
