import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductItem extends StatelessWidget {
  static String routeName = '/product-item';
  Product? selected_product;

  @override
  Widget build(BuildContext context) {
    selected_product = ModalRoute.of(context)?.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(title: Text(selected_product!.title),centerTitle: true,),
      body: Container(
        child: Text(selected_product!.description),
      ),
    );
  }
}
