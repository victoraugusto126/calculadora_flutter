import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'resultado_screen.dart';

void main() => runApp(MyApp()); // Aqui chamamos o MaterialApp

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculator',
      home: SimpleCalc(),
    );
  }
}

class SimpleCalc extends StatefulWidget {
  const SimpleCalc({super.key});

  @override
  State<SimpleCalc> createState() => _SimpleCalcState();
}

class _SimpleCalcState extends State<SimpleCalc> {
  String resultado = 'A soma é:';
  double num1 = 0.0;
  double num2 = 0.0;

  @override
  Widget build(BuildContext context) {
    TextField n1 = TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: 'Número 01',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) => num1 = double.tryParse(value) ?? 0.0,
    );

    TextField n2 = TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: 'Número 02',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) => num2 = double.tryParse(value) ?? 0.0,
    );

    Padding fix = Padding(padding: EdgeInsets.all(5.0));

    ElevatedButton btn = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrange,
      ),
      onPressed: () {
        double calc = num1 + num2;
        String resultadoTexto = "O resultado da soma é $calc";

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultadoScreen(resultado: resultadoTexto),
          ),
        );
      },
      child: Text(
        'somar',
        style: TextStyle(color: Colors.white),
      ),
    );

    Column cols = Column(
      children: [
        n1,
        fix,
        n2,
        fix,
        SizedBox(width: double.infinity, child: btn),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora Soma',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: cols,
      ),
    );
  }
}
