
import 'package:flutter/material.dart';
import 'package:shopping_app/products.dart';
import '../models/product_model.dart';

class ProductsProvider with ChangeNotifier{
  List<Product> _items = products;
  List<Product>? cart_items = [];


  bool showFavoritesOnly = false;

  List<Product> get itemsGetter{
    if(showFavoritesOnly) {
      return[..._items.where((element) => element.is_favourite)];
    }
    return [..._items];
  }

  void showFavourites(bool show)
  {
    showFavoritesOnly = show;
    notifyListeners();
  }

  List<Product>? get cartItemsGetter{
    return cart_items;
  }

  void addProduct()
  {
    Product myproduct = Product(
      id: 'p1',
      title: 'Brown Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
      'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      isFav: false,
    );

    _items.add(myproduct);

    notifyListeners();
  }

  void toggleFavourite(int index)
  {
    _items[index].is_favourite = !_items[index].is_favourite;
    // Product k = _items.firstWhere((element) => element.id == prod_id);
    // k.is_favourite = !k.is_favourite;
    notifyListeners();
  }

  void addToBasket(Product prod)
  {
    cart_items?.add(prod);
  }
}
