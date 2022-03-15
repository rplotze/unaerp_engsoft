import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Estrutura Básica',

      //definir qual será a UI inicial
      home: TelaPrincipal(),
    ),
  );
}

//
// TELA PRINCIPAL
// Stateless = stl + TAB
class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BARRA DE TÍTULO
      appBar: AppBar(
        title: const Text('Meu primeiro App'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {},
          )
        ],
      ),

      backgroundColor: Colors.grey.shade100,

      //CORPO
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Hello Flutter!',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.directions_car,
                  size: 60,
                ),
                Icon(
                  Icons.directions_bus,
                  size: 60,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.directions_train,
                  size: 60,
                ),
                Icon(
                  Icons.directions_bike,
                  size: 60,
                ),
              ],
            ),
            const Text(
              'Hello Flutter!',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            const Text(
              'Hello Flutter!',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
