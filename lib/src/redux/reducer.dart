import '../models/cart_item.dart';
import 'actions.dart';

List<CartItem> cartItemReducer(List<CartItem> items, action){
  if(action is AddItemAction){
    return addItem(items, action);
  }
  else if(action is ToggleItemStateAction){
    return toggleItem(items, action);
  }
  else if(action is DeleteItemAction){
    return deleteItem(items, action);
  }

  return items;
}

List<CartItem> addItem(List<CartItem> items, AddItemAction action){
  return List.from(items)..add(action.item);
}

List<CartItem> toggleItem(List<CartItem> items, ToggleItemStateAction action){
  List<CartItem> newItems = items.map((item){
    return item.name == action.item.name ? action.item : item;
  }).toList();

  return newItems;
}

List<CartItem> deleteItem(List<CartItem> items, DeleteItemAction action){
  return List.from(items)..remove(action.item);
}