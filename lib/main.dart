import 'package:flutter/material.dart';
import '../screens/CartItems.dart';
import '../providers/products_provider.dart';
import '../screens/ProductItem.dart';
import '../widgets/product_tile.dart';
import 'products.dart';

import 'models/product_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) { return ProductsProvider(); },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.purple, fontFamily: 'Raleway'),
        home: HomePage(),
        routes: {
          ProductItem.routeName : (ctx) => ProductItem(),
          CartItem.routeName : (ctx) => CartItem(),
        },

      ),
    );
  }

  }


class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage>
{
 // List<Product> my_products = products;

  late List<Product> my_products;
  @override
  Widget build(BuildContext context) {
    final ProductData = Provider.of<ProductsProvider>(context);
    my_products = ProductData.itemsGetter;
    return Scaffold(
      appBar: AppBar(title: Text('SimoShop'),actions: [
        IconButton(onPressed: (){
         // ProductData.addProduct();
          Navigator.of(context).pushNamed(CartItem.routeName);
        }, icon: Icon(Icons.shopping_cart)),

        PopupMenuButton(itemBuilder: (_)=>[PopupMenuItem(child: Text('Favourites Only'),onTap: (){ProductData.showFavourites(true);},),
          PopupMenuItem(child: Text('Show All'), onTap: (){ProductData.showFavourites(false);},),

        ]),


      ]),
      body: ProductsGrid(),
    );
  }

  Widget ProductsGrid(){
    return GridView.builder(
      itemBuilder: (BuildContext ctx, index)
        {
          return ProductTile(index);
        },
      itemCount: my_products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3/2,crossAxisSpacing: 5),
    );
}



}

