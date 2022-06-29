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
            child: ListView.builder(itemBuilder: (context, index) {
              final prod = card_products[index];
              return Dismissible(
                confirmDismiss: (direction)
                async {
                  switch(direction){
                    case DismissDirection.endToStart:
                      return await _showConfirmDialog(context, 'Deleting in a bit') == true;
                    case DismissDirection.startToEnd:
                      return await _showConfirmDialog(context, 'Editing in a bit') == true;
                  }
                },
                onDismissed: (DismissDirection direction) {
                  switch(direction){
                    case DismissDirection.endToStart:
                      productsProvider.removeFromBasket(prod);
                      break;
                    case DismissDirection.startToEnd:
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Edit Alert'),duration: Duration(seconds: 2),));
                  }
                },
                background:
                Container(
                  color: Colors.green,
                    child: Row(children : [Icon(Icons.edit, color: Colors.white, size: 40,),
                    Text('Edit'),
                    ]),
                  alignment: Alignment.centerLeft,
                ),
                secondaryBackground:
                Container(
                color: Colors.red,
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.white, size: 40,),
                      Text('Delete', textAlign: TextAlign.right,),

                    ],
                ),
                  alignment: Alignment.centerRight,
              ),

                key: ValueKey(prod.id),
                child: Card(child: ListTile(
                  leading: CircleAvatar(child: FittedBox(
                    child: Text('\$${card_products[index].price}'),
                  ),),
                  trailing: Text('1 *'),
                  title: Text(card_products[index].title),
                  subtitle: Text('Total : \$40'),
                ),
                ),
              );
            },itemCount: card_products.length,
          ),
        ),




          ]
        ),
      ),
    );
  }

 Future<bool?> _showConfirmDialog(BuildContext context, String s) {
    return showDialog<bool>(
      context: context,
      builder: (_)=>
          AlertDialog(
            title: Text('Sure?'),
            content: Text(s),
            actions: [TextButton(onPressed: (){
              Navigator.of(context).pop(false);
            }, child: Text('No')),
            TextButton(onPressed: (){
              Navigator.of(context).pop(true);
            }, child: Text('Yes'))],
          )

    );
 }
}
