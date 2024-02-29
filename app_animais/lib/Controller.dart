import 'package:app_animais/model.dart';

class AnimalController {
  // Atributo
  List<Animal> _listAnimal = [];

  // Getter da lista
  List<Animal> get listarAnimais => _listAnimal;

  void adicionarAnimal(String especie, String urlFoto, String urlAudio) {
    Animal novoAnimal = Animal(especie, urlFoto, urlAudio);
    _listAnimal.add(novoAnimal);
  }
}
