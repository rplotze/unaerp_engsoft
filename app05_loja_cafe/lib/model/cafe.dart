class Cafe {
  String nome;
  String preco;

  Cafe(this.nome, this.preco);

  factory Cafe.fromJson(Map<String, dynamic> json) {
    return Cafe(
      json['nome'],
      json['preco'],
    );
  }
}
