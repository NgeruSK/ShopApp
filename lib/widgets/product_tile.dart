import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/providers/products_provider.dart';
import 'package:shopping_app/screens/ProductItem.dart';

class ProductTile extends StatefulWidget {

  int index;
  ProductTile(this.index);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  late List<Product> my_products;

  @override
  Widget build(BuildContext context) {
    final ProductData = Provider.of<ProductsProvider>(context);
    my_products = ProductData.itemsGetter;
    Product selected_product = my_products[widget.index];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            child: Image.network(selected_product.imageUrl, fit: BoxFit.cover,
              errorBuilder: (context, exception, stackTrace) {
                return Column(children : const [
                  Text('Error Loading Image', style: TextStyle(color: Colors.red),),
                  Icon(Icons.error_outline_sharp)
                ],);
              },
            ),
            onTap: ()
              {
                Navigator.of(context).pushNamed(ProductItem.routeName, arguments: selected_product);
              }
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(icon: selected_product.is_favourite ? Icon(Icons.favorite, color: Colors.red,
            )
                : Icon(Icons.favorite_border),
                onPressed: (){ProductData.toggleFavourite(widget.index);}),
            title: Text(selected_product.title),trailing: IconButton(icon: Icon(Icons.add_shopping_cart),
              onPressed: (){
              ProductData.addToBasket(selected_product);
              }),),
        ),
      ),
    );
  }
}
