class Product
{
  late String id, title, description, imageUrl;
  late double price;
  bool is_favourite = false;

  Product({required String id, required String title, required String description, required String imageUrl, required double price, required bool isFav})
  {
    this.id = id;
    this.title = title;
    this.description=description;
    this.imageUrl = imageUrl;
    this.price = price;
    this.is_favourite = isFav;
  }

}