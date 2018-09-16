import 'package:flutter/material.dart';
import 'package:shopping_cart_app/src/widgets/shopping_list_item.dart';
import '../models/cart_item.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StoreConnector<List<CartItem>, List<CartItem>>(
      converter: (store) => store.state,
      builder: (context, list){
        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index){
              return ShoppingListItem(item: list[index], index: index,);
            }
        );
      },
    );
  }
}
