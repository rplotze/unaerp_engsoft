import 'package:app05_loja_cafe/pages/widgets/campo_texto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'widgets/mensagem.dart';

class InserirPage extends StatefulWidget {
  const InserirPage({Key? key}) : super(key: key);

  @override
  _InserirPageState createState() => _InserirPageState();
}

class _InserirPageState extends State<InserirPage> {
  var txtNome = TextEditingController();
  var txtPreco = TextEditingController();

  //
  // RETORNAR UM Café a partir do ID
  //
  getDocumentById(id) async {
    await FirebaseFirestore.instance
        .collection('cafes')
        .doc(id)
        .get()
        .then((doc) {
      txtNome.text = doc.get('nome');
      txtPreco.text = doc.get('preco');
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    // RECUPERAR O ID do Café
    //
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (txtNome.text.isEmpty && txtPreco.text.isEmpty) {
        getDocumentById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Café Store'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Colors.brown[50],
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            campoTexto('Nome', txtNome, Icons.coffee_outlined),
            const SizedBox(height: 20),
            campoTexto('Preço', txtPreco, Icons.monetization_on_outlined),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.brown.shade900,
                    ),
                    child: const Text('salvar'),
                    onPressed: () {
                      if (id == null) {
                        // ADICIONAR UM NOVO DOCUMENTO
                        FirebaseFirestore.instance.collection('cafes').add(
                          {
                            'nome': txtNome.text,
                            'preco': txtPreco.text,
                          },
                        );
                        sucesso(context, 'Item adicionado com sucesso.');
                      } else {
                        FirebaseFirestore.instance
                            .collection('cafes')
                            .doc(id.toString())
                            .set(
                          {
                            'nome': txtNome.text,
                            'preco': txtPreco.text,
                          },
                        );
                        sucesso(context, 'Item alterado com sucesso.');
                      }
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.brown.shade900,
                      ),
                      child: const Text('cancelar'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
