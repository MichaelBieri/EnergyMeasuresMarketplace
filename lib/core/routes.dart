import 'package:energy_measures_marketplace/presentation/screens/home_screen.dart';
import 'package:energy_measures_marketplace/presentation/screens/login_screen.dart';
import 'package:energy_measures_marketplace/presentation/screens/registration_screen.dart';
import 'package:energy_measures_marketplace/presentation/screens/verification_screen.dart';
import 'package:flutter/material.dart';

  const String loginRoute = '/login';
  const String homeRoute = '/home';
  const String registrationRoute = '/registration';
  const String verificationRoute = '/verification';

Map<String, Widget Function (BuildContext)> getRoutes(BuildContext context) {
  {
    return {
      loginRoute: (context) => const LoginScreen(title: 'Login'),
      homeRoute: (context) => const HomeScreen(),
      registrationRoute: (context) => const RegistrationScreen(),
      verificationRoute: (context) => const VerificationScreen(),
    };
  }
}