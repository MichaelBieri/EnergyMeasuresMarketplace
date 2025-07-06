import 'package:easy_localization/easy_localization.dart';
import 'package:energy_measures_marketplace/blocs/authentication_bloc.dart';
import 'package:energy_measures_marketplace/core/firebase_options.dart';
import 'package:energy_measures_marketplace/core/routes.dart' as routes;
import 'package:energy_measures_marketplace/services/service_registration.dart'
    as service_registration;
import 'package:energy_measures_marketplace/presentation/screens/login_screen.dart';
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
      supportedLocales: [Locale('de'), Locale('fr'), Locale('it')],
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
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'Energiesparmassnahmen Handelsplattform',
        routes: routes.getRoutes(context),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.lightBlueAccent.shade100,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              elevation: 7.0,
            ),
          ),
          appBarTheme: AppBarTheme(
            color: Colors.deepPurple.shade200,
            elevation: 4,
          ),
          drawerTheme: DrawerThemeData(
            backgroundColor: Colors.deepPurple.shade50,
            elevation: 3,
          ),
        ),
        home: const LoginScreen(title: 'Energy Measures Marketplace DEV'),
      ),
    );
  }
}
