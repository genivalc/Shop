import 'package:flutter/material.dart';

class ProductFromScreen extends StatefulWidget {
  @override
  _ProductFromScreen createState() => _ProductFromScreen();
}

class _ProductFromScreen extends State<ProductFromScreen> {
  final _priceFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário Produto"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
              child: ListView(children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Título"),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Preço"),
              textInputAction: TextInputAction.next,
              focusNode: _priceFocusNode,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            )
          ]))),
    );
  }
}
