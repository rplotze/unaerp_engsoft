import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'IMC',
    home: TelaPrincipal(),
  ));
}

//
// STATEFUL Widget
// stf+TAB
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  //Declaração dos atributos que serão usados para recuperar
  //os dados informados pelo usuário no TextFormField
  var txtPeso = TextEditingController();
  var txtAltura = TextEditingController();

  //Declaração do atributo responsável por identificar
  //unicamente o formulário
  var form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),
      backgroundColor: Colors.grey.shade200,
      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Form(
              //definir o id do formulário
              key: form,
              child: Column(
                children: [
                  Icon(
                    Icons.people_alt,
                    size: 100,
                    color: Colors.blue.shade900,
                  ),
                  const SizedBox(height: 20),
                  campoTexto('Peso', txtPeso),
                  const SizedBox(height: 10),
                  campoTexto('Altura', txtAltura),
                  const SizedBox(height: 30),
                  botao('calcular'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //
  // CAMPO DE TEXTO
  //
  campoTexto(rotulo, variavel) {
    return TextFormField(
      //Associação da variável de controle
      controller: variavel,

      style: TextStyle(
        fontSize: 32,
        color: Colors.blue.shade900,
      ),

      maxLength: 10,

      keyboardType: TextInputType.number,

      obscureText: false,

      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(
          fontSize: 24,
          color: Colors.grey.shade900,
        ),
        hintText: 'Informe um valor',
        hintStyle: TextStyle(
          fontSize: 18,
          color: Colors.grey.shade400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),

      //VALIDAÇÃO DOS DADOS
      validator: (value) {
        value = value!.replaceFirst(',', '.');
        if (double.tryParse(value) == null) {
          return 'Entre com um valor numérico';
        } else {
          return null;
        }
      },
    );
  }

  //
  // BOTÃO
  //
  botao(rotulo) {
    return SizedBox(
      width: 250,
      height: 50,
      child: ElevatedButton(
        //evento que ocorrerá quando o usuário acionar
        //o botão
        onPressed: () {
          //disparar o validator
          if (form.currentState!.validate()) {
            //O método setState é utilizado para acessar
            //o estado das variáveis
            setState(() {
              double peso = double.parse(txtPeso.text);
              double altura = double.parse(txtAltura.text);
              double imc = peso / pow(altura, 2);
              caixaDialogo('O valor do IMC: ${imc.toStringAsFixed(2)}');
            });
          }
        },
        //rótulo
        child: Text(
          rotulo,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue.shade900,
        ),
      ),
    );
  }

  //
  // CAIXA DE DIÁLOGO
  //
  caixaDialogo(msg) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Calculadora IMC'),
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  txtPeso.clear();
                  txtAltura.clear();
                });
              },
              child: const Text('fechar'),
            )
          ],
        );
      },
    );
  }
}
