class ProductModel {
  int id;
  int categoryId;
  String name;
  double price;
  String description;
  dynamic tags;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductModel({
    this.id = 0,
    this.categoryId = 0,
    this.name = '',
    this.price = 0,
    this.description = 'ks djfksdjfkdsl fjkdslfj ksdfjk af',
    this.tags,
    this.createdAt,
    this.updatedAt,
  });
}
