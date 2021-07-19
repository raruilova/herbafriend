import 'dart:convert';

import 'package:herbafriend/src/model/image_herba.dart';

Recipes recipesFromJson(String str) => Recipes.fromJson(json.decode(str));

String recipesToJson(Recipes data) => json.encode(data.toJson());

class Recipes {
  Recipes({
    this.id,
    required this.name,
    required this.ingredients,
    required this.preparation,
  });
  Recipes.create(this.name, this.ingredients, this.preparation);

  String? id;
  String? name;
  String? ingredients;
  String? preparation;

  factory Recipes.fromJson(Map<String, dynamic> json) => Recipes(
        id: json["id"],
        name: json["name"],
        ingredients: json["ingredients"],
        preparation: json["preparation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ingredients": ingredients,
        "preparation": preparation,
      };
}
