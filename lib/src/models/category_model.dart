class Category {
  String id;
  String categoryName;
  String imagePath;

  Category({
    this.id,
    this.categoryName,
    this.imagePath,
  });

  Category.fromMap(Map<String, dynamic> mapData) {
    this.id = mapData['uid'];
    this.categoryName = mapData['name'];
    this.imagePath = mapData['image'];
  }
}
