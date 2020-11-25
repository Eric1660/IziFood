import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:izifood/lista_produto.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'IziFood',
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(
                "IziFood",
                style: new TextStyle(
                    fontSize: 40.0,
                    color: const Color(0xFFffffff),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
              ),
              new RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ListaProduto()));
                  },
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                    left: 40,
                    top: 20,
                    right: 40,
                    bottom: 20,
                  ),
                  child: new Text(
                    "Entrar",
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.red,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                  ))
            ]),
        color: const Color(0xFFff0000),
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
      ),
    );
  }

  void buttonPressed() {}
}
