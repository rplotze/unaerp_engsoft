import 'dart:convert';

import 'package:app06_coopertransc/model/viagem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/vez.dart';
import 'api.dart';

class ViagensPage extends StatefulWidget {
  const ViagensPage({Key? key}) : super(key: key);

  @override
  State<ViagensPage> createState() => _ViagensPageState();
}

class _ViagensPageState extends State<ViagensPage> {
  //LISTA DINÂMICA de Objetos da classe Vez
  var token;

  getViagens() async {
    List<Viagem> lista = [];
    try {
      var resposta = await http.get(
        Uri.parse(Api.URL + 'viagens'),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
      );
      print(resposta.body.toString());
      var dados = json.decode(resposta.body.toString());
      for (var item in dados) {
        lista.add(Viagem.fromJson(item));
      }
    } catch (erro) {
      print(erro.toString());
    }
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    token = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: const Text('Viagens')),
      body: FutureBuilder(
        future: getViagens(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var dados = snapshot.data as List<Viagem>;
            return ListView.builder(
              itemCount: dados.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                        '${dados[index].id} - ${dados[index].idCooperado} '),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
