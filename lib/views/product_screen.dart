import 'package:flutter/material.dart';
import 'package:shop/views/app_drawer.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciar Produtos"),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(itemCount: products.itemsCount , itemBuilder: (ctx, i) => Text("Teste")),
      ),
    );
  }
}
