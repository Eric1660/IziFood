import 'package:flutter/material.dart';
import 'package:izifood/lista_produto.dart';

class logar extends StatefulWidget {
  @override
  _logarState createState() => _logarState();
}

class _logarState extends State<logar> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(
                "IziFood",
                style: new TextStyle(
                    fontSize: 40.0,
                    color: const Color(0xFFffffff),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto"),
              ),
              new TextField(
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(15.0),
                      ),
                    ),
                    labelText: "E-mail",
                    fillColor: Colors.white,
                    filled: true),
                keyboardType: TextInputType.emailAddress,
                style: new TextStyle(
                    fontSize: 15.0,
                    color: const Color(0xFFffffff),
                    fontWeight: FontWeight.w300,
                    fontFamily: "Roboto"),
              ),
              new TextField(
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(15.0),
                      ),
                    ),
                    labelText: "Senha",
                    fillColor: Colors.white,
                    filled: true),
                keyboardType: TextInputType.emailAddress,
                style: new TextStyle(
                    fontSize: 15.0,
                    color: const Color(0xFFffffff),
                    fontWeight: FontWeight.w300,
                    fontFamily: "Roboto"),
              ),
              new RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListaProduto()),
                    );
                  },
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.red)),
                  child: new Text(
                    "Logar",
                    style: new TextStyle(
                        fontSize: 25.0,
                        color: Colors.red,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Roboto"),
                  ))
            ]),
        color: const Color(0xFFf80000),
        padding: const EdgeInsets.all(40.0),
        alignment: Alignment.center,
      ),
    );
  }

  void buttonPressed() {}
}
