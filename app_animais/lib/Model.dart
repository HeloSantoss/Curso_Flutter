class Animal {
  // Atributos
  String _especie;
  String _urlFoto;
  String _urlAudio;

  // Construtor
  Animal(this._especie, this._urlFoto, this._urlAudio);

  // Getters
  String get especie => _especie;
  String get urlFoto => _urlFoto;
  String get urlAudio => _urlAudio;

  // Setters
  void set especie(String especie) {
    _especie = especie;
  }

  void set urlAudio(String urlAudio) {
    _urlAudio = urlAudio;
  }

  void set urlFoto(String urlFoto) {
    _urlFoto = urlFoto;
  }
}
