import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/login_page.dart';
import 'pages/widgets/principal_page.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Café Store',
    initialRoute: 'login',
    routes: {
      'login': (context) => const LoginPage(),
      'principal': (context) => const PrincipalPage(),
    },
  ));
}
