import 'package:energy_measures_marketplace/blocs/authentication_bloc.dart';
import 'package:energy_measures_marketplace/core/bloc_state_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  // Methoden
  Widget blocBuilder(context, state) {
      if (state.stateType == BlocStateType.loading) {
        return const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
        );
        
    } else {
      return Container();
    }
  }

  bool buildWhen(previousState, state) {
    return true;
  }

  void blocListener(context, state) {
    if (state is VerificationEmailSent &&
        state.stateType == BlocStateType.success) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: "Verifizierungsemail erfolgreich gesendet",
        ),
      );
    } else if (state is VerificationEmailSent &&
        state.stateType == BlocStateType.error) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Fehler beim Senden der Verifizierungsemail",
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
            colors: [Colors.deepPurple.shade400, Colors.deepPurple.shade100],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Einfach und schnell Energiesparmassnahmen kaufen oder verkaufen. Erstellen Sie ein Konto",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity, //Container nimt ganze Bildschirm breite ein
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
                      const SizedBox(height: 150.0),
                      // BlocConsumer for login state handling
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: BlocConsumer<
                          AuthenticationBloc,
                          AuthenticationState
                        >(
                          listener: blocListener,
                          buildWhen: buildWhen,
                          builder: blocBuilder,
                        ),
                      ),

                      const Text(
                        "Bitte verifizieren Sie Ihre E-Mail-Adresse",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30.0),

                      // Verification Button
                      ElevatedButton(
                        onPressed: () async {
                          BlocProvider.of<AuthenticationBloc>(
                            context,
                          ).add(VerifyUserEvent());
                        },
                        child: const Text('Verifizierung'),
                      ),

                      const SizedBox(height: 20.0),

                      /* // Registration Button
                      ElevatedButton( 
                        style: ElevatedButton.styleFrom(
                          minimumSize:  const Size(200, 50),
                        ),
                        onPressed: () async {
                          BlocProvider.of<AuthenticationBloc>(context).add(
                            RegistrationEvent(_usernameController.text, _usernameController.text, _passwordController.text));
                        },
                        child: const Text('Registrieren'),
                      ), */
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
