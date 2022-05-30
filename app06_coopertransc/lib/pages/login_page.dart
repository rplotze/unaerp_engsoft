import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var USUARIO = '040256088472';
  var SENHA = '040256088472';

  Future<Map<String, dynamic>> login(usr,pwd) async {

    var resposta = await http.post(
      Uri.parse(Api.URL + '/login'),
      headers: {
        "Accept": "application/json",
      },
      body: {
        "username": usr,
        "password": pwd,
      },
    );
    print(resposta.body.toString());
    return json.decode(resposta.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: login(USUARIO,SENHA),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //
            // RETORNO DA CHAMADA A API
            //
            var dados = snapshot.data as Map<String, dynamic>;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${dados['id'].toString()}'),
                Text('Nome: ${dados['nome'].toString()}'),
                Text('Username: ${dados['username'].toString()}'),
                Text('Token: ${dados['token'].toString()}', style: TextStyle(fontSize: 10),),
                //Center(child: Text(snapshot.data.toString())),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
