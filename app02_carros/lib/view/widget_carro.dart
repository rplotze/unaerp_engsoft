import 'package:flutter/material.dart';

class WidgetCarro extends StatelessWidget {
  //Declaração de atributos que serão utilizados para
  //receber dados externos
  final String marca;
  final String modelo;
  final String imagem;

  const WidgetCarro(this.marca, this.modelo, this.imagem, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margens
      //margin: const EdgeInsets.all(60),
      margin: const EdgeInsets.fromLTRB(40, 40, 40, 0),

      //espaçamento
      padding: const EdgeInsets.all(30),

      //bordas
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black45,
        ),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade300,
      ),

      width: MediaQuery.of(context).size.width * 0.90,
      height: 350,

      child: Column(
        children: [
          Text(
            marca,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            modelo,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 24,
              fontStyle: FontStyle.italic,
            ),
          ),

          //
          // Imagem
          //
          Image.asset(
            imagem,
            scale: 2.0,
          ),
        ],
      ),
    );
  }
}
