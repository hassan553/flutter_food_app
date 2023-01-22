class MealModel {
  MealModel({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.spicy,
    required this.vegetarian,
    required this.price,
    required this.image,
    this.isFavourite=false,
  });
  late final int id;
  late final String name;

  late final List<String> ingredients;
  late final bool spicy;
  late final bool vegetarian;
  late final dynamic price;
  late final String image;
  dynamic isFavourite;

  MealModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    ingredients = List.castFrom<dynamic, String>(json['ingredients']);
    spicy = json['spicy'];
    vegetarian = json['vegetarian'];
    price = json['price'];
    image = json['image'];
  }
}
