import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';  

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Container()),

          ListTile(
            leading: const Icon(Icons.flag),
            //title: Text(translate('sidebar_changelanguage')),
            onTap: () {
              String currentLanguage = Localizations.localeOf(context).languageCode;
            },
          ),

          ListTile(
            leading: const Icon(Icons.dark_mode),
            //title: const Text(translate('sidebar_changedarkmode')),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.exit_to_app),
            //title: const Text(translate('sidebar_changelogout')),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
