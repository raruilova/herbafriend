// To parse this JSON data, do
//
//     final recipes = recipesFromJson(jsonString);

import 'dart:convert';

Recipes recipesFromJson(String str) => Recipes.fromJson(json.decode(str));

String recipesToJson(Recipes data) => json.encode(data.toJson());

class Recipes {
  Recipes({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Recipes.fromJson(Map<String, dynamic> json) => Recipes(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
