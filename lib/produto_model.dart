class Produto {
  String _id;
  String _nome;
  String _descricao;
  String _preco;
  Produto(this._id, this._nome, this._descricao, this._preco);

  Produto.map(dynamic obj) {
    this._id = obj['id'];
    this._nome = obj['nome'];
    this._descricao = obj['descricao'];
    this._preco = obj['preco'];
  }
  Produto.fromMap(Map<String, dynamic> map, String id) {
    this._id = id ?? '';
    this._nome = map["nome"];
    this._descricao = map['descricao'];
    this._preco = map["preco"];
  }

  String get id => _id;
  String get nome => _nome;
  String get descricao => _descricao;
  String get preco => _preco;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map["nome"] = _nome;
    map["descricao"] = this._descricao;
    map["preco"] = this._preco;
    return map;
  }
}
