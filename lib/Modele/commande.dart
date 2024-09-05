class Commande {
  int nombre = 0;
  late String id;
  Commande(this.id);

  void setNombre(int nombre) {
    this.nombre = nombre;
  }

  int getNombre(){
    return this.nombre;
  }
}
