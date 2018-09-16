import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_cart_app/src/models/cart_item.dart';
import '../redux/actions.dart';

class AddItemDialog extends StatefulWidget {
  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {

  String name = "";

  @override
  Widget build(BuildContext context) {

    return StoreConnector<List<CartItem>, OnItemAddCallback>(
      converter: (store) => (itemName) => store.dispatch(AddItemAction(CartItem(name: itemName, checked: false))),
      builder: (context, callback){
        return AlertDialog(
          title: Text("Add Item"),
          contentPadding: EdgeInsets.all(16.0),
          content: Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "e.g Iphone",
                        labelText: "Item Name"
                    ),
                    onChanged: (value){
                      name = value;
                    },
                  )
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("Cancel")
            ),
            FlatButton(
                onPressed: (){
                  callback(name);
                  Navigator.of(context).pop();
                },
                child: Text("Add")
            )
          ],
        );
      },
    );
  }
}

typedef OnItemAddCallback = Function(String itemName);