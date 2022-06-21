import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/providers/products_provider.dart';

class CartItem extends StatelessWidget {

  late List<Product> card_products;
  static String routeName = '/cart-items';


  @override
  Widget build(BuildContext context) {

    final productsProvider = Provider.of<ProductsProvider>(context);
    card_products = productsProvider.cartItemsGetter!;
    return Scaffold(
      appBar: AppBar(title: Text('My Cart'),),
      body: Container(
        height: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
        child: card_products.isEmpty ? Center(child: Text('You Cart Is Empty!')):
        Column(
          children: [
            Container(
              padding:EdgeInsets.all(20),

              child: Row(
                children: [
                  Text('Totals:'),
                  SizedBox(width: 20,),
                  Text('\$500'),
                  Spacer(),
                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Order Now', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 20)),
                      ),
                    onPressed: ()=>{},
                  ),
                ],
              ),

            ),

            Expanded(
            child: ListView.builder(itemBuilder: (context, index) =>
              Card(child: ListTile(
                leading: CircleAvatar(child: FittedBox(child: Text('\$${card_products[index].price}'),
                ),),
                trailing: Text('1 *'),
                title: Text(card_products[index].title),
                subtitle: Text('Total : \$40'),
              ),
              ),itemCount: card_products.length,
          ),
        ),




          ]
        ),
      ),
    );
  }
}
