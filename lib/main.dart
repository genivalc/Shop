import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import './views/product_detail_screen.dart';
import './views/cart_screen.dart';
import './views/products_overview_screen.dart';
import './views/orders_screen.dart';

import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';

import './utils/app_rountes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: "Lato",
        ),
        home: ProductOverviewScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRountes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
          AppRountes.CART: (ctx) => CartScreen(),
          AppRountes.ORDERS: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}
