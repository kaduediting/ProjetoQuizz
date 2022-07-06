import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é o seu Anime favorito?',
      'respostas': [
        {'texto': 'One Piece', 'pontuacao': 10},
        {'texto': 'Fullmetal Alchemist', 'pontuacao': 5},
        {'texto': 'Black Clover', 'pontuacao': 3},
        {'texto': 'Soul Eater', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é a sua Série favorita?',
      'respostas': [
        {'texto': 'Supernatural', 'pontuacao': 10},
        {'texto': 'Mr. Robot', 'pontuacao': 5},
        {'texto': 'Stranger Things', 'pontuacao': 3},
        {'texto': 'Umbrella Academy', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é a sua Opening favorita?',
      'respostas': [
        {'texto': 'We Are - One Piece', 'pontuacao': 10},
        {'texto': 'Black Catcher - Black Clover', 'pontuacao': 5},
        {'texto': 'Creditless - Fullmetal Alchemist', 'pontuacao': 3},
        {'texto': 'OVER THE TOP - One Piece', 'pontuacao': 1},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
