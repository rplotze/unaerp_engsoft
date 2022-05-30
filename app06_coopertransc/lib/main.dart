import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'pages/vez_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CooperTransc',
      initialRoute: 'login',
      routes: {
        'vez': (context) => const VezPage(),
        'login': (context) => const LoginPage(),
      },
    ),
  );
}
