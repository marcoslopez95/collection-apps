class CartModel {
  final String profileImage;
  final String plantName;
  final String rating;
  final String sold;
  final String price;
  final String description;
  final String total;
  final int initialQuantity;

  CartModel({
    required this.profileImage,
    required this.plantName,
    required this.rating,
    required this.sold,
    required this.price,
    required this.description,
    required this.total,
    this.initialQuantity = 1,
  });
}
