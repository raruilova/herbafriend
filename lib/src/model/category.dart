// To parse this JSON data, do
//
//     final recipes = recipesFromJson(jsonString);

import 'dart:convert';

CategoryRecipe recipesFromJson(String str) =>
    CategoryRecipe.fromJson(json.decode(str));

String recipesToJson(CategoryRecipe data) => json.encode(data.toJson());

class CategoryRecipe {
  CategoryRecipe({
    required this.name,
  });

  String name;

  factory CategoryRecipe.fromJson(Map<String, dynamic> json) => CategoryRecipe(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
