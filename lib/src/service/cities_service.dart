import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:herbafriend/src/model/cities_model.dart';

class CitiesService {
  CitiesService();

  //Future, indica que es una llama asíncrona
  Future<List<Cities>> getCities() async =>
      rootBundle.loadString("assets/data/coordinates.json").then((data) {
        List<Cities> items = [];
        List<dynamic> jsonList = json.decode(data);
        for (var item in jsonList) {
          final type = new Cities.fromJson(item);
          items.add(type);
        }
        return items;
      });
}

//comentario de prueba
