import 'package:flutter/material.dart';
import 'logar.dart';
import 'cadastro.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.red,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    )
                  ]),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => cadastro()),
                          );
                        },
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(7.5, 15, 7.5, 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(color: Colors.red)),
                        child: new Text(
                          "Cadastrar",
                          style: new TextStyle(
                              fontSize: 25.0,
                              color: Colors.red,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Roboto"),
                        ))
                  ]),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => logar()),
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
                  ])
            ]),
        color: const Color(0xFFff0000),
        padding: const EdgeInsets.all(40.0),
        alignment: Alignment.center,
      ),
    );
  }

  void buttonPressed() {}
}
