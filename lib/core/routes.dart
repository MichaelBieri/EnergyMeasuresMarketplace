import 'package:flutter/material.dart';

  const String loginRoute = '/login';
  const String homeRoute = '/home';
  const String registrationRoute = '/register';
  const String verificationRoute = '/verification';

Map<String, Widget Function (BuildContext)> getRoutes(BuildContext context) {
  {
    return {
      //loginRoute: (context) => const LoginScreen(title: 'Login'),
      //homeRoute: (context) => const HomeScreen(),
      //registrationRoute: (context) => const RegistrationScreen(),
      //verificationRoute: (context) => const VerificationScreen(),
    };
  } 
}