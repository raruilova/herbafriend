// To parse this JSON data, do
//
//     final recipes = recipesFromJson(jsonString);

import 'dart:convert';

CategoryRecipe recipesFromJson(String str) =>
    CategoryRecipe.fromJson(json.decode(str));

String recipesToJson(CategoryRecipe data) => json.encode(data.toJson());

class CategoryRecipe {
  CategoryRecipe({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory CategoryRecipe.fromJson(Map<String, dynamic> json) => CategoryRecipe(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
