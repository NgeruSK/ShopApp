class Product
{
  late String id, title, description, imageUrl;
  late double price;

  Product({required String id, required String title, required String description, required String imageUrl, required double price})
  {
    this.id = id;
    this.title = title;
    this.description=description;
    this.imageUrl = imageUrl;
    this.price = price;
  }

}