import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:izifood/produto_model.dart';
import 'main.dart';

class NovoProduto extends StatefulWidget {
  final Produto produto;
  NovoProduto(this.produto);
  @override
  _NovoProdutoState createState() => _NovoProdutoState();
}

class _NovoProdutoState extends State<NovoProduto> {
  final db = FirebaseFirestore.instance;
  TextEditingController nomecontroller;
  TextEditingController descricaocontroller;
  TextEditingController precocontroller;

  @override
  void initState() {
    super.initState();
    nomecontroller = new TextEditingController(text: widget.produto.nome);
    descricaocontroller =
        new TextEditingController(text: widget.produto.descricao);
    precocontroller = new TextEditingController(text: widget.produto.preco);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Novo Produto/Alterar'),
        backgroundColor: Colors.red,
      ),
      body: Container(
          margin: EdgeInsets.all(18.0),
          alignment: Alignment.center,
          child: Column(children: [
            TextField(
              controller: nomecontroller,
              decoration: InputDecoration(labelText: "Nome do Produto"),
            ),
            TextField(
              controller: descricaocontroller,
              decoration: InputDecoration(labelText: "Descrição"),
            ),
            TextField(
              controller: precocontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Preço"),
            ),
            RaisedButton(
                color: Colors.red,
                child: (widget.produto.id != null)
                    ? Text("Alterar",
                        style: TextStyle(fontSize: 20, color: Colors.white))
                    : Text(
                        "Novo",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                onPressed: () {
                  if (widget.produto.id != null) {
                    db.collection("cardapio").doc(widget.produto.id).set({
                      "nome": nomecontroller.text,
                      "descricao": descricaocontroller.text,
                      "preco": precocontroller.text
                    });
                  } else {
                    db.collection("cardapio").doc().set({
                      "nome": nomecontroller.text,
                      "descricao": descricaocontroller.text,
                      "preco": precocontroller.text
                    });
                  }
                  Navigator.pop(context);
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                }),
            RaisedButton(
                color: Colors.red,
                child: Text(
                  "Cancelar",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
          ])),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Sair"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyApp()));
            },
          ),
        ],
      )),
    );
  }
}
