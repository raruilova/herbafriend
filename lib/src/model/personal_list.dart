// To parse this JSON data, do
//
//     final personalList = personalListFromJson(jsonString);

import 'dart:convert';

PersonalList personalListFromJson(String str) => PersonalList.fromJson(json.decode(str));

String personalListToJson(PersonalList data) => json.encode(data.toJson());

class PersonalList {
    PersonalList({
        this.id,
        required this.name,
        required this.description,
    });

    int? id;
    String name;
    String description;

    PersonalList.create(this.name, this.description);
    factory PersonalList.fromJson(Map<String, dynamic> json) => PersonalList(
        id: json["id"],
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
    };
}