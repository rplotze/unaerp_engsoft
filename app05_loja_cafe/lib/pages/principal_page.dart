import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/cafe.dart';
import 'widgets/mensagem.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  // REFERENCIAR a coleção de CAFES
  var cafes;

  @override
  void initState() {
    super.initState();
    cafes = FirebaseFirestore.instance.collection('cafes');
  }

  Widget exibirDocumento(item) {
    Cafe c = Cafe.fromJson(item.data());
    return ListTile(
      title: Text(
        c.nome,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        c.preco,
        style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          cafes.doc(item.id).delete();
          sucesso(context, 'Documento apagado com sucesso.');
        },
      ),

      onTap: () {
        Navigator.pushNamed(
          context,
          'inserir',
          arguments: item.id,
        );
      },

      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Café Store'),
        centerTitle: true,
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: false,
        actions: [
          Column(
            children: [
              IconButton(
                tooltip: 'sair',
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, 'login');
                },
                icon: const Icon(Icons.logout),
              ),
              Text(
                FirebaseAuth.instance.currentUser!.email.toString(),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      backgroundColor: Colors.brown[50],
      body: Container(
        padding: const EdgeInsets.all(50),

        //
        // EXIBIR A COLEÇÃO DE CAFÉS
        //
        child: StreamBuilder<QuerySnapshot>(
          //fonte de dados
          stream: cafes.snapshots(),
          //exibir os resultados
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(child: Text('Não foi possível conectar'));
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context, index) {
                    return exibirDocumento(dados.docs[index]);
                  },
                );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'inserir');
        },
      ),
    );
  }
}
