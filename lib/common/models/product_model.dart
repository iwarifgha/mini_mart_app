class ProductModel {
  final String id;
  final String name;
  final List<String> bulletDescription;
  final double price;
  final String imageUrl;
 bool isFavorited;

  ProductModel({
    required this.id,
    required this.name,
    required this.bulletDescription,
    this.isFavorited = false,
    required this.price,
    required this.imageUrl,
  });

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $bulletDescription, price: $price, imageUrl: $imageUrl)';
  }
}
