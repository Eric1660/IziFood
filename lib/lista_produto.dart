import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'produto_model.dart';
import 'main.dart';
import 'novo_produto.dart';

class ListaProduto extends StatefulWidget {
  @override
  _ListaProdutoState createState() => _ListaProdutoState();
}

class _ListaProdutoState extends State<ListaProduto> {
  List<Produto> items;

  var db = FirebaseFirestore.instance;
  StreamSubscription<QuerySnapshot> produtoinscrito;

  @override
  void initState() {
    //iniciaservico();
    super.initState();
    items = List();
    produtoinscrito?.cancel();
    produtoinscrito = db.collection("cardapio").snapshots().listen((snapshot) {
      final List<Produto> produto = snapshot.docs
          .map((documentSnapshot) =>
              Produto.fromMap(documentSnapshot.data(), documentSnapshot.id))
          .toList();
      setState(() {
        this.items = produto;
      });
    });
  }

  @override
  void dispose() {
    produtoinscrito?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('IziFood'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: getListaProduto(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                      default:
                        List<DocumentSnapshot> documentos = snapshot.data.docs;
                        return ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            itemCount: items.length,
                            itemBuilder: (_, index) {
                              return ListTile(
                                title: Text(items[index].nome,
                                    style: TextStyle(fontSize: 20)),
                                subtitle: Text(items[index].descricao,
                                    style: TextStyle(fontSize: 12)),
                                trailing: Text("R\$ " + items[index].preco,
                                    style: TextStyle(fontSize: 20)),
                                leading: Column(
                                  children: [
                                    IconButton(
                                        icon: const Icon(Icons.delete_forever),
                                        onPressed: () {
                                          excluiProduto(context,
                                              documentos[index], index);
                                        })
                                  ],
                                ),
                                onTap: () =>
                                    navegarProdutos(context, items[index]),
                              );
                            });
                    }
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () => cadastrarProduto(context, Produto(null, "", "", "")),
      ),
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

  Stream<QuerySnapshot> getListaProduto() {
    return FirebaseFirestore.instance.collection("cardapio").snapshots();
  }

  void excluiProduto(
      BuildContext context, DocumentSnapshot doc, int posicao) async {
    //iniciaservico();
    db.collection("cardapio").doc(doc.id).delete();
    setState(() {
      //iniciaservico();
      items.removeAt(posicao);
    });
  }

  void navegarProdutos(BuildContext context, Produto produto) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NovoProduto(produto)),
    );
  }

  void cadastrarProduto(BuildContext context, Produto produto) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => NovoProduto(Produto(null, "", "", ""))),
    );
  }
}
