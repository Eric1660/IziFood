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
  TextEditingController precocontroller;

  @override
  void initState() {
    super.initState();
    nomecontroller = new TextEditingController(text: widget.produto.nome);
    precocontroller = new TextEditingController(text: widget.produto.preco);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('IziFood'),
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
              controller: precocontroller,
              decoration: InputDecoration(labelText: "Preço"),
            ),
            RaisedButton(
                color: Colors.greenAccent[400],
                child: (widget.produto.id != null)
                    ? Text("Alterar")
                    : Text(
                        "Novo",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                onPressed: () {
                  if (widget.produto.id != null) {
                    db.collection("cardapio").doc(widget.produto.id).set({
                      "Produto": nomecontroller.text,
                      "Preço": precocontroller.text
                    });
                  } else {
                    db.collection("cardapio").doc(widget.produto.id).set({
                      "Produto": nomecontroller.text,
                      "Preço": precocontroller.text
                    });
                  }
                  Navigator.pop(context);
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
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
