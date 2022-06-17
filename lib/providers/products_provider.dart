
import 'package:flutter/material.dart';
import 'package:shopping_app/products.dart';
import '../models/product_model.dart';

class ProductsProvider with ChangeNotifier{
  List<Product> _items = products;

  List<Product> get itemsGetter{
    return [..._items];
  }

  void addProduct()
  {
    notifyListeners();
  }
}
