import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'lista_produto.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "IziFood",
      theme: ThemeData(primarySwatch: Colors.red),
      home: ListaProduto(),
    );
  }
}
