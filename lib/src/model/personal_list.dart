import 'dart:convert';

PersonalList personalListFromJson(String str) =>
    PersonalList.fromJson(json.decode(str));

String personalListToJson(PersonalList data) => json.encode(data.toJson());

class PersonalList {
  PersonalList({
    this.id,
    required this.name,
    required this.description,
    required this.active,
  });

  int? id;
  String name;
  String description;
  bool active;

  PersonalList.create(this.name,this.description, this.active);

  factory PersonalList.fromJson(Map<String, dynamic> json) => PersonalList(
        id: json["id"],
        name: json["name"],
        description: json['description'],
        active: json["active"] == 1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
        "description": description
      };
}