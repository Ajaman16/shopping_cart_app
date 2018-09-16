import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_cart_app/src/models/cart_item.dart';
import '../redux/actions.dart';

class ShoppingListItem extends StatefulWidget {

  final CartItem item;
  final int index;


  ShoppingListItem({this.item, this.index});

  @override
  _ShoppingListItemState createState() => _ShoppingListItemState();
}

class _ShoppingListItemState extends State<ShoppingListItem> {
  @override
  Widget build(BuildContext context) {

    return StoreConnector<List<CartItem>, OnDeleteCallback>(
      converter: (store) => (item) => store.dispatch(DeleteItemAction(item)),
      builder: (context, deleteCallback){
        return Dismissible(
            key: Key("${widget.index}"),
            onDismissed: (_){
              deleteCallback(widget.item);
            },
            child: StoreConnector<List<CartItem>, onToggleCallback>(
              converter: (store) => (item) => store.dispatch(ToggleItemStateAction(item)),
              builder: (context, callback){
                return ListTile(
                  leading: Checkbox(value: widget.item.checked,
                      onChanged: (value){
                        callback(CartItem(name: widget.item.name, checked: value));
                      }
                  ),
                  trailing: IconButton(icon: Icon(Icons.delete), onPressed: null),
                  title: Text("${widget.item.name}"),
                );
              },
            )
        );
      },
    );
  }
}

typedef onToggleCallback = Function(CartItem item);
typedef OnDeleteCallback = Function(CartItem item);