class Product {
  int? id;
  String? nome;
  String? categoria;
  List<String>? descricao;
  double? preco;
  String? parcela;
  String? image;
  String? condicao;

  Product(
      {this.id,
      this.nome,
      this.categoria,
      this.descricao,
      this.preco,
      this.parcela,
      this.image,
      this.condicao});

  Product.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    categoria = json['categoria'];
    descricao = json['descricao'].cast<String>();
    preco = json['preco'];
    parcela = json['parcela'];
    image = json['image'];
    condicao = json['condicao'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['categoria'] = categoria;
    data['descricao'] = descricao;
    data['preco'] = preco;
    data['parcela'] = parcela;
    data['image'] = image;
    data['condicao'] = condicao;
    return data;
  }
}
