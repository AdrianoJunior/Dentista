import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Adicionar Produto"),
      ),
    );
  }
}
