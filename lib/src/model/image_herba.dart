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
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
  });

  int? id;
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;

  factory Recipes.fromJson(Map<String, dynamic> json) => Recipes(
        id: json["id"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
      };
}
