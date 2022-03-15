import 'package:flutter/material.dart';

import 'view/tela_principal.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WebCars',
      home: TelaPrincipal(),
    ),
  );
}
