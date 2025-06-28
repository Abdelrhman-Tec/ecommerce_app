class CartItemModel {
  final String image;
  final String id;
  final String name;
  final double price;
  int quantity;

  CartItemModel({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  CartItemModel copyWith({
    String? image,
    String? id,
    String? name,
    double? price,
    int? quantity,
  }) {
    return CartItemModel(
      image: image ?? this.image,
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}
