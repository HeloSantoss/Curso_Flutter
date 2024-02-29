import 'package:app_lista1/TarefaController.dart';
import 'package:app_lista1/TarefaView.dart';
import 'package:flutter/material.dart';

class ListaTarefaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ListaTarefasControler(),
        child: ListaTarefasScreen(),
      ),
    );
  }

  ChangeNotifierProvider(
      {required ListaTarefasControler Function(dynamic context) create,
      required ListaTarefasScreen child}) {}
}
