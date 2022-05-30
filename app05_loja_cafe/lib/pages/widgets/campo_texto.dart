import 'package:flutter/material.dart';

campoTexto(texto, controller, icone, {senha}) {
  return TextField(
    controller: controller,
    obscureText: senha != null ? true : false,
    style: const TextStyle(
      color: Colors.brown,
      fontWeight: FontWeight.w300,
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(icone, color: Colors.brown),
      prefixIconColor: Colors.brown,
      labelText: texto,
      labelStyle: const TextStyle(color: Colors.brown),
      border: const OutlineInputBorder(),
      focusColor: Colors.brown,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.brown,
          width: 0.0,
        ),
      ),
    ),
  );
}
