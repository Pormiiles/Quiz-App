import 'package:flutter/material.dart';
import 'package:quizapp_estrutura_inicial/perguntas.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> marcadorDePontos = [
  ];

  List<Perguntas> bancoDePerguntas = [
    Perguntas('O metrô é um dos meios de transporte mais seguros do mundo.', true),
    Perguntas('A culinária brasileira é uma das melhores do mundo.', true),
    Perguntas('Vacas podem voar, assim como peixes utilizam os pés para andar.', false)
  ];

  int questaoAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                bancoDePerguntas[questaoAtual].questao,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
              ),
              child: Text(
                'Verdadeiro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //O usuário clica no botão verdadeiro.

                bool respCerta = bancoDePerguntas[questaoAtual].resposta;

                if(respCerta == true) {
                  print("Usuário acertou!");
                } else {
                  print("Usuário errou!");
                }

                setState(() {
                  questaoAtual++;
                }); 
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade800
              ),
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //O usuário clica no botão falso.

                bool respErrada = bancoDePerguntas[questaoAtual].resposta;

                if(respErrada == false) {
                  print("Usuário acertou!");
                } else {
                  print("Usuário errou!");
                }

                setState(() {
                  questaoAtual++;
                });
              },
            ),
          ),
        ),
        Row(
          children: marcadorDePontos,
        )
      ],
    );
  }
}


