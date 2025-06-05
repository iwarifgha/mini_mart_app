class CartItemModel {
  final String id;
  final String productId;
  final String productImageUrl;
  final String name;
  final double price;
  final int quantity;

  CartItemModel({
    required this.productImageUrl,
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
  });

  double get totalPrice => price * quantity;

  @override
  String toString() {
    return 'CartItemModel(id: $id, productId: $productId, name: $name, price: $price, quantity: $quantity)';
  }
}
