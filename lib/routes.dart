import 'package:flutter/widgets.dart';
import 'package:seizure_detection/screens/cart/cart_screen.dart';
import 'package:seizure_detection/screens/complete_profile/complete_profile_screen.dart';
import 'package:seizure_detection/screens/details/details_screen.dart';
import 'package:seizure_detection/screens/forgot_password/forgot_password_screen.dart';
import 'package:seizure_detection/screens/home/home_screen.dart';
import 'package:seizure_detection/screens/login_success/login_success_screen.dart';
import 'package:seizure_detection/screens/otp/otp_screen.dart';
import 'package:seizure_detection/screens/patient_information/patient_information_screen.dart';
import 'package:seizure_detection/screens/profile/profile_screen.dart';
import 'package:seizure_detection/screens/sign_in/sign_in_screen.dart';
import 'package:seizure_detection/screens/splash/splash_screen.dart';

import 'package:seizure_detection/screens/history_patient/history_patient_screen.dart';
import 'package:seizure_detection/screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  PatientInformationScreen.routeName: (context) => PatientInformationScreen(),
  HistoryPatientScreen.routeName: (context) => HistoryPatientScreen(),
};
