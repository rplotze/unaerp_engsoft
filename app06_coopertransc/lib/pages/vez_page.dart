import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/vez.dart';

class VezPage extends StatefulWidget {
  const VezPage({Key? key}) : super(key: key);

  @override
  State<VezPage> createState() => _VezPageState();
}

class _VezPageState extends State<VezPage> {
  //LISTA DINÂMICA de Objetos da classe Vez
  List<Vez> dados = [];

  //URL BASE API
  var URL = 'http://www.coopertransc.com.br/api/public/api';

  @override
  void initState() {
    super.initState();
    getVez();
  }

  void getVez() async {
    await http.get(
      Uri.parse('http://localhost:8000/db.json'),
      headers: {
        "content-type": "application/json",
      },
    ).then((resposta) {
      print(resposta.body);
    }).catchError((erro) {
      print(erro.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
