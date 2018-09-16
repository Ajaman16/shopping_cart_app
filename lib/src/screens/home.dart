import 'package:flutter/material.dart';
import 'package:shopping_cart_app/src/screens/add_item_dialog.dart';
import 'package:shopping_cart_app/src/widgets/shopping_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart App"),
      ),
      body: buildList(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _openAddEntryDialog(context),
          child: Icon(Icons.add),
      ),
    );
  }

  Widget buildList() {
    return ShoppingList();
  }

  void _openAddEntryDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context){
          return AddItemDialog();
        }
    );
  }
}
