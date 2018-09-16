import '../models/cart_item.dart';

class AddItemAction{
  final CartItem item;

  AddItemAction(this.item);
}

class ToggleItemStateAction{
  final CartItem item;

  ToggleItemStateAction(this.item);
}

class DeleteItemAction{
  final CartItem item;

  DeleteItemAction(this.item);
}