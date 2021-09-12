// To parse this JSON data, do
//
//     final cities = citiesFromJson(jsonString);

import 'dart:convert';

List<Cities> citiesFromJson(String str) => List<Cities>.from(json.decode(str).map((x) => Cities.fromJson(x)));

String citiesToJson(List<Cities> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cities {
    Cities({
        this.nombre,
        this.provincia,
        this.longitud,
        this.latitud,
        this.habitantes,
    });


    String? nombre;
    String? provincia;
    double? longitud;
    double? latitud;
    String? habitantes;

    factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        nombre: json["nombre"],
        provincia: json["provincia"],
        longitud: json["longitud"].toDouble(),
        latitud: json["latitud"].toDouble(),
        habitantes: json["habitantes"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "provincia": provincia,
        "longitud": longitud,
        "latitud": latitud,
        "habitantes": habitantes,
    };
}
