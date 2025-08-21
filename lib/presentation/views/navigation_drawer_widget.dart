/*
// Hier von github die Vorlahe verwenden
import 'package:energy_measures_marketplace/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:energy_measures_marketplace/blocs/theme_bloc/theme_bloc.dart';
import 'package:energy_measures_marketplace/core/bloc_state_type.dart';
import 'package:energy_measures_marketplace/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {

    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is LogoutState && state.stateType == BlocStateType.success) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            loginRoute,
            (route) => false,
          );
        }
      },
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Container()),

            ListTile(
              leading: const Icon(Icons.flag),
              //title: Text(translate('sidebar_changelanguage')),
              onTap: () {
              },
            ),

            ListTile(
              leading: Icon( isLightTheme ? Icons.dark_mode : Icons.light_mode),
              //title: const Text(translate('sidebar_changedarkmode')), muss auch ändern video 166
              onTap: () {
                bool isLightTheme =
                    Theme.of(context).brightness == Brightness.light;

                if (isLightTheme) {
                  BlocProvider.of<ThemeBloc>(
                    context,
                  ).add(ThemeChangedEvent(false));
                } else {
                  BlocProvider.of<ThemeBloc>(
                    context,
                  ).add(ThemeChangedEvent(true));
                }
              },
            ),

            ListTile(
              leading: const Icon(Icons.exit_to_app),
              //title: const Text(translate('sidebar_changelogout')),
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LogoutEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/