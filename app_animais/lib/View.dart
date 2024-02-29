import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaListaAnimais extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Animais'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Novo Animal',
                suffixIcon: IconButton(
                  onPressed: () {
                    var animalController =
                        Provider.of<AnimalController>(context, listen: false);
                    animalController.adicionarAnimal(_controller.text);
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<AnimalController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.animais.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(model.animais[index].descricao),
                      trailing: IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () {
                          model.marcarComoConcluido(index);
                        },
                      ),
                      onLongPress: () {
                        model.excluirAnimal(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AnimalController extends ChangeNotifier {
  List<Animal> _animais = [];

  List<Animal> get animais => _animais;

  void adicionarAnimal(String descricao) {
    _animais.add(Animal(descricao: descricao, concluido: false));
    notifyListeners();
  }

  void marcarComoConcluido(int index) {
    _animais[index].concluido = true;
    notifyListeners();
  }

  void excluirAnimal(int index) {
    _animais.removeAt(index);
    notifyListeners();
  }
}

class Animal {
  String descricao;
  bool concluido;

  Animal({required this.descricao, required this.concluido});
}
