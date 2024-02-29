import 'package:flutter/material.dart';
import 'Controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final animalController = AnimalController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Animais',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaListaAnimais(animalController: animalController),
    );
  }
}

class TelaListaAnimais extends StatelessWidget {
  final animalController;

  TelaListaAnimais({required this.animalController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Animais'),
      ),
      body: Column(
        children: [
          // Aqui você pode adicionar widgets para exibir a lista de animais
        ],
      ),
    );
  }
}
