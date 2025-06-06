class CartItemModel {
  final String id;
  final String productImageUrl;
  final String name;
  final double price;
  final int quantity;

  CartItemModel({
    required this.productImageUrl,
    required this.id,

    required this.name,
    required this.price,
    required this.quantity,
  });

  double get totalPrice => price * quantity;

  CartItemModel copyWith({int? quantity}) {
    return CartItemModel(
      id: id,
      name: name,
      price: price,
      quantity: quantity ?? this.quantity,
      productImageUrl: productImageUrl,
    );
  }

  @override
  String toString() {
    return 'CartItemModel(id: $id,   name: $name, price: $price, quantity: $quantity)';
  }
}
