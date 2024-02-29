import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo de Adivinhação', // Título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema do aplicativo
      ),
      home: const JogoAdivinhacao(
          title:
              'Jogo de Adivinhação'), // Definição da página inicial do aplicativo
    );
  }
}

class JogoAdivinhacao extends StatefulWidget {
  final String title;

  const JogoAdivinhacao({Key? key, required this.title}) : super(key: key);

  @override
  _JogoAdivinhacaoState createState() => _JogoAdivinhacaoState();
}

class _JogoAdivinhacaoState extends State<JogoAdivinhacao> {
  final _random = Random();
  late int _numeroSecreto;
  late TextEditingController _controlador;
  String _resultado = '';
  int _tentativas = 0;

  @override
  void initState() {
    super.initState();
    _numeroSecreto =
        _random.nextInt(100) + 1; // Gera um número aleatório entre 1 e 100
    _controlador =
        TextEditingController(); // Inicializa o controlador do campo de texto
  }

  @override
  void dispose() {
    _controlador
        .dispose(); // Descarta o controlador para evitar vazamento de memória
    super.dispose();
  }

  void _fazerAdivinhacao(int palpite) {
    setState(() {
      _tentativas++;

      if (palpite == _numeroSecreto) {
        _resultado =
            'Parabéns! Você adivinhou o número $_numeroSecreto em $_tentativas tentativas.';
      } else if (palpite < _numeroSecreto) {
        _resultado = 'Tente um número maior!';
      } else {
        _resultado = 'Tente um número menor!';
      }

      if (palpite == _numeroSecreto) {
        _exibirDialogo(); // Exibe uma caixa de diálogo quando o número é adivinhado corretamente
      }
    });
  }

  void _exibirDialogo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Parabéns!'), // Título da caixa de diálogo
          content: Text(
              'Você adivinhou o número $_numeroSecreto em $_tentativas tentativas.'), // Conteúdo da caixa de diálogo
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _numeroSecreto =
                      _random.nextInt(100) + 1; // Gera um novo número secreto
                  _resultado = ''; // Limpa o resultado
                  _tentativas = 0; // Reinicia o contador de tentativas
                  _controlador.clear(); // Limpa o campo de texto
                });
                Navigator.of(context).pop(); // Fecha a caixa de diálogo
              },
              child: const Text(
                  'Jogar Novamente'), // Texto do botão para jogar novamente
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // Título da barra de navegação
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_resultado.isNotEmpty)
              Text(_resultado), // Exibe o resultado das tentativas
            TextField(
              controller: _controlador, // Controlador do campo de texto
              keyboardType: TextInputType
                  .number, // Define o tipo de teclado para entrada numérica
              decoration: const InputDecoration(
                labelText: 'Digite seu palpite', // Rótulo do campo de texto
              ),
            ),
            ElevatedButton(
              onPressed: () {
                int palpite = int.tryParse(_controlador.text) ??
                    0; // Converte o texto do campo de texto para um número inteiro
                if (palpite >= 1 && palpite <= 100) {
                  _fazerAdivinhacao(
                      palpite); // Faz a adivinhação com o palpite fornecido
                } else {
                  setState(() {
                    _resultado =
                        'Por favor, digite um número entre 1 e 100.'; // Exibe uma mensagem de erro se o palpite estiver fora do intervalo válido
                  });
                }
              },
              child: const Text(
                  'Adivinhar'), // Texto do botão para fazer uma adivinhação
            ),
          ],
        ),
      ),
    );
  }
}
