import 'package:flutter/material.dart';

class ResultadoScreen extends StatelessWidget {
  final String resultado;

  const ResultadoScreen({super.key, required this.resultado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
                    centerTitle: true,

        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Center(
        child: Column(
    mainAxisAlignment: MainAxisAlignment.center,    // opcional: centraliza verticalmente

          children: [
            Text(resultado,
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
            ),
            

            ElevatedButton(
              style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrange,
      ),
              onPressed: (){
                Navigator.pop(context);
              }, child: Text(
                'Voltar',
                style: TextStyle(color: Colors.white),
                ),)
          ],
        ),),),
    );
  }
}