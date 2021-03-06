import 'dart:convert';

Recipes recipesFromJson(String str) => Recipes.fromJson(json.decode(str));

String recipesToJson(Recipes data) => json.encode(data.toJson());

class Recipes {
  Recipes({
    this.id,
    required this.name,
    required this.ingredients,
    required this.preparation,
    this.imagen,
    this.category,
  });
  Recipes.create(this.name, this.ingredients, this.preparation, this.category);

  String? id;
  String? name;
  String? ingredients;
  String? preparation;
  String? imagen;
  String? category;

  factory Recipes.fromJson(Map<String, dynamic> json) => Recipes(
      id: json["id"],
      name: json["name"],
      ingredients: json["ingredients"],
      preparation: json["preparation"],
      imagen: json["imagen"],
      category: json["category"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ingredients": ingredients,
        "preparation": preparation,
        "imagen": imagen,
        "category": category
      };
}
