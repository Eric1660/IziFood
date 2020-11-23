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
  StreamSubscription<QuerySnapshot> produtossinscritos;

  @override
  void initState() {
    //iniciaservico();
    super.initState();
    items = List();
    produtossinscritos?.cancel();
    produtossinscritos =
        db.collection("cardapio").snapshots().listen((snapshot) {
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
    produtossinscritos?.cancel();
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
                  stream: getListaLivros(),
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
                            itemCount: documentos.length,
                            itemBuilder: (_, index) {
                              return ListTile(
                                title: Text(items[index].nome,
                                    style: TextStyle(fontSize: 24)),
                                subtitle: Text(items[index].preco,
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
                                    navegarLivros(context, items[index]),
                              );
                            });
                    }
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.greenAccent[600],
        onPressed: () => cadastrarProduto(context, Produto(null, "", "")),
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

  Stream<QuerySnapshot> getListaLivros() {
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

  void navegarLivros(BuildContext context, Produto produto) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NovoProduto(produto)),
    );
  }

  void cadastrarProduto(BuildContext context, Produto produto) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => NovoProduto(Produto(null, "", ""))),
    );
  }
}
