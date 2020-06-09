import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/products.dart';
import '../utils/app_rountes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.title),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRountes.PRODUCTS_FORM,
                arguments: product,
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).errorColor,
            ),
            onPressed: () {
              return showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        title: Text("Excluir Produto"),
                        content: Text("Tem certeza?"),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Provider.of<Products>(context, listen: false)
                                    .deleteProduct(product.id);
                                Navigator.of(ctx).pop();
                              },
                              child: Text("Sim")),
                          FlatButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Text("Não"))
                        ],
                      ));
            },
          ),
        ]),
      ),
    );
  }
}
