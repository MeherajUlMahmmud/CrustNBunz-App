class Food {
  String id;
  String name;
  String description;
  String imagePath;
  String category;
  double price;
  double discount;
  double ratings;

  Food({
    this.id,
    this.name,
    this.description,
    this.imagePath,
    this.category,
    this.price,
    this.discount,
    this.ratings,
  });

  Food.fromMap(Map<String, dynamic> mapData) {
    this.id = mapData['uid'];
    this.name = mapData['name'];
    this.description = mapData['description'];
    this.imagePath = mapData['image'];
    this.category = mapData['category'];
    this.price = mapData['price'];
    this.discount = mapData['discount'];
    this.ratings = mapData['ratings'];
  }
}
