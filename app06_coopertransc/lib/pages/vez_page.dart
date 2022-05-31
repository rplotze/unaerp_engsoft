import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/vez.dart';
import 'api.dart';

class VezPage extends StatefulWidget {
  const VezPage({Key? key}) : super(key: key);

  @override
  State<VezPage> createState() => _VezPageState();
}

class _VezPageState extends State<VezPage> {
  //LISTA DINÂMICA de Objetos da classe Vez
  var token;

  Future<List<Vez>> getVez() async {
    List<Vez> lista = [];
    try {
      var resposta = await http.get(
        Uri.parse(Api.URL + 'vez'),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
      );
      var dados = json.decode(resposta.body.toString());
      for (var item in dados) {
        lista.add(Vez.fromJson(item));
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
      appBar: AppBar(title: const Text('Vez')),
      body: FutureBuilder(
        future: getVez(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var dados = snapshot.data as List<Vez>;
            return ListView.builder(
              itemCount: dados.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                        '${dados[index].id} - ${dados[index].cooperado} - ${dados[index].veiculo}'),
                    subtitle: Text(
                        '${dados[index].dataMarcacao} - ${dados[index].horaMarcacao} - ${dados[index].idUnidade} - ${dados[index].engatado} - ${dados[index].tipo_veiculo} - ${dados[index].unidade} - ${dados[index].estados}  - ${dados[index].chegada}'),
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
