import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/screens/ProductItem.dart';

class ProductTile extends StatefulWidget {
  Product selected_product;

  ProductTile(this.selected_product);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            child: Image.network(widget.selected_product.imageUrl, fit: BoxFit.cover,
              errorBuilder: (context, exception, stackTrace) {
                return Column(children : const [
                  Text('Error Loading Image', style: TextStyle(color: Colors.red),),
                  Icon(Icons.error_outline_sharp)
                ],);
              },
            ),
            onTap: ()
              {
                Navigator.of(context).pushNamed(ProductItem.routeName, arguments: widget.selected_product);
              }
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(icon: Icon(Icons.favorite),onPressed: (){}), title: Text(widget.selected_product.title),trailing: IconButton(icon: Icon(Icons.add_shopping_cart),onPressed: (){}),),
        ),
      ),
    );
  }
}
