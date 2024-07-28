class OrderModel {
  final String id;
  final String itemName;
  final String quantity;
  final String amount;
  final String promo;
  final String total;
  final String date;
  final String transactionId;
  final String status;
  final String category;
  final String image;

  OrderModel({
    required this.id,
    required this.itemName,
    required this.quantity,
    required this.amount,
    required this.promo,
    required this.total,
    required this.date,
    required this.transactionId,
    required this.status,
    required this.category,
    required this.image,
  });
}

