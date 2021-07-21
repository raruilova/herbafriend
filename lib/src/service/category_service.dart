import 'dart:convert';

import 'package:herbafriend/src/model/category.dart';
import 'package:flutter/services.dart' show rootBundle;

class CategoryService {
  CategoryService();

  //Future, indica que es una llama asíncrona
  Future<List<CategoryRecipe>> getCategory() async =>
      rootBundle.loadString("assets/data/category.json").then((data) {
        List<CategoryRecipe> items = [];
        List<dynamic> jsonList = json.decode(data);
        for (var item in jsonList) {
          final type = new CategoryRecipe.fromJson(item);
          items.add(type);
        }
        return items;
      });
}

//comentario de prueba
