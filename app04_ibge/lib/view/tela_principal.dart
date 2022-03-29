import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/pais.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  //lista dinâmica de paises
  List<Pais> lista = [];

  //
  // CARREGAR JSON
  // Leitura de um arquivo Json
  carregarJson() async {
    final String f = await rootBundle.loadString('lib/data/paises.json');
    final dynamic d = await json.decode(f);
    setState(() {
      d.forEach((item) {
        lista.add(Pais.fromJson(item));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await carregarJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IBGE'),
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.white30,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                lista[index].nome,
                style: const TextStyle(fontSize: 28),
              ),
              subtitle: Text(
                'Capital: ${lista[index].capital} / Área: ${lista[index].area} km²',
                style: const TextStyle(fontSize: 18),
              ),
              //ícone lado esquerdo
              leading: const Icon(Icons.place),
              //ícone lado direito
              trailing: const Icon(Icons.arrow_right),
              //comportamento
              onTap: () {
                //Navegar para TelaDetalhes passando como argumento
                //o Pais selecionado pelo usuário
                Navigator.pushNamed(context, 't2', arguments: lista[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
