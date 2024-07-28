class OfferModel{
  int id;
  String plantName;
  String rating;
  String sold;
  String price;
  String profileImage;
  bool isInWishlist;
  String description;

  OfferModel({
    this.id = -1,
    this.plantName = '',
    this.rating = '',
    this.sold = '',
    this.price = '',
    this.profileImage = '',
    this.isInWishlist = false,
    this.description = ''
  });
}
