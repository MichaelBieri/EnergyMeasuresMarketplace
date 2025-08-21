/*

import 'package:energy_measures_marketplace/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:energy_measures_marketplace/core/bloc_state_type.dart';
import 'package:energy_measures_marketplace/presentation/views/input_field.dart';
import 'package:energy_measures_marketplace/presentation/views/registration_login_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:energy_measures_marketplace/core/routes.dart' as routes;

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _confirmEmailController = TextEditingController(); 
  final TextEditingController _passwordController = TextEditingController();



// Methoden
  Widget blocBuilder(context, state) {
        
                  if (state.stateType == BlocStateType.loading) {
                    return const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                    );
                  } else if (state is LoginState && state.stateType == BlocStateType.error) {
                    return const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.error, color: Colors.red, size: 30.0),
                        SizedBox(width: 10.0),
                        Text(
                          'Falscher Benutzername oder Passwort',
                          style: TextStyle(color: Colors.red, fontSize: 16.0),
                        ),
                      ],
                    );
                  } else if (state is RegistrationState && state.stateType == BlocStateType.error) {
                    return const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.error, color: Colors.red, size: 30.0),
                        SizedBox(width: 10.0),
                        Text(
                          'Fehler bei der Registrierung',
                          style: TextStyle(color: Colors.red, fontSize: 16.0),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                }

  bool buildMethod(previousState, state) {
                  return state is LoginState;
                }

  void blocListener(AuthenticationState state, BuildContext context) {
    
              
    if (state is LoginState || state is RegistrationState && state.stateType == BlocStateType.success) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: "Erfolgreich eingeloggt",
        ),
      );
              
      // Navigate to home screen after successful login
      Navigator.popAndPushNamed(context, routes.homeRoute); 
              
    } else if (state is LoginState && state.stateType == BlocStateType.error) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Fehler beim Einloggen",
        ),
      );
    } else if (state is RegistrationState && state.stateType == BlocStateType.error) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Fehler beim Registrieren",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple.shade400,
              Colors.deepPurple.shade100,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: const Text("Einfach und schnell Energiesparmassnahmen kaufen oder verkaufen. Erstellen Sie ein Konto", style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ))
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60.0),
                    topRight: Radius.circular(60.0),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50.0),
                      // BlocConsumer for login state handling
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                          listener: (context, state) {
                            blocListener(state, context);
                          },
                          buildWhen: buildMethod,
                          builder: blocBuilder,
                        ),
                      ),
                  
                      // Email1
                      InputField(
                        textEditingController: _usernameController,
                        labelText: "Email" ,
                        iconData: Icons.person,
                      ),

                      // Email2
                      InputField(
                        textEditingController: _confirmEmailController,
                        labelText: "Bestätige Mail" ,
                        iconData: Icons.person,
                      ),
                
                      // Password Input Field
                      InputField(
                        textEditingController: _passwordController,
                        labelText: "Passwort" ,
                        hidden: true,
                        iconData: Icons.lock,
                      ),
                  
                      const SizedBox(height: 30.0),
                
                      // ElevatedButton for registration
                      ElevatedButton(
                        onPressed: () async {
                          BlocProvider.of<AuthenticationBloc>(context).add(
                              RegistrationEvent(_usernameController.text, _confirmEmailController, _passwordController.text),
                          );
                        },
                        child: const Text('Registrieren'),
                      ),
                      const SizedBox(height: 20.0),

                      RegistrationOrLoginText(onTap: () {
                        Navigator.popAndPushNamed(context, routes.loginRoute);
                      },
                      text1: "Ich habe schon ein Konto? ",
                      text2: "Hier anmelden",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/