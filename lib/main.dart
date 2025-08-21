import 'package:easy_localization/easy_localization.dart';
import 'package:energy_measures_marketplace/blocs/theme_bloc/theme_bloc.dart';
import 'package:energy_measures_marketplace/core/firebase_options.dart';
import 'package:energy_measures_marketplace/core/routes.dart' as routes;
import 'package:energy_measures_marketplace/core/themes/dark_theme.dart';
import 'package:energy_measures_marketplace/core/themes/light_theme.dart';
import 'package:energy_measures_marketplace/services/service_registration.dart'
    as service_registration;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  await service_registration.init();

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('de'),
        Locale('fr'),
        Locale('it'),
        Locale('en'),
      ],
      path: 'assets/translations/',
      fallbackLocale: Locale('de'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create:
              (BuildContext context) =>
                  AuthenticationBloc(), //Initialisiert den AuthenticationBloc
        ),
        BlocProvider<ThemeBloc>(create: (BuildContext context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates, //Falsch?
            supportedLocales: context.supportedLocales, // Falsch?
            locale: context.locale, // Falsch?
            debugShowCheckedModeBanner: false,
            title: 'Handelsplattform für Energiesparmassnahmen',
            routes: routes.getRoutes(context),
            themeMode: ThemeMode.system,
            theme: getTheme(state),
            darkTheme: getDarkTheme(),
            //home: const LoginScreen(title: 'Energy Measures Marketplace DEV'),
          );
        },
      ),
    );
  }

getTheme(ThemeState state){
  if(state is ThemeInitial) return getLightTheme();

  if(state is LightThemeState) return getLightTheme();

  if(state is DarkThemeState) return getDarkTheme();
}
  
}