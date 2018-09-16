import 'package:flutter/material.dart';
import 'package:shopping_cart_app/src/models/cart_item.dart';
import 'package:shopping_cart_app/src/screens/home.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'redux/reducer.dart';

class ShoppingApp extends StatelessWidget {

  final Store<List<CartItem>> store = Store<List<CartItem>>(cartItemReducer, initialState: List<CartItem>());

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: "Shopping Cart",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Home(),
      ),
    );
  }
}
