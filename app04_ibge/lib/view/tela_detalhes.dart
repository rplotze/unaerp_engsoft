import 'package:flutter/material.dart';

import '../model/pais.dart';

class TelaDetalhes extends StatefulWidget {
  const TelaDetalhes({Key? key}) : super(key: key);

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  @override
  Widget build(BuildContext context) {
    //
    // RECUPERAR DADOS PASSADOS COMO PARÂMETRO
    //
    var p = ModalRoute.of(context)!.settings.arguments as Pais;

    return Scaffold(
      appBar: AppBar(
        title: const Text('IBGE'),
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.white30,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                'https://countryflagsapi.com/png/' +
                    p.abreviatura.toLowerCase(),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(p.historico),
            ],
          ),
        ),
      ),
      //
      // Float Action Button
      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${p.nome.toUpperCase()} adicionado aos favoritos.',
              ),
            ),
          );
          Navigator.pop(context);
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}
