import 'dart:convert';

import 'package:herbafriend/src/model/categories.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  CategoryService();

  //Future, indica que es una llama asíncrona
  Future<List<CategoryRecipe>> getCategory() async {
    List<CategoryRecipe> items = [];
    try {
      var uri = Uri.https("backhebrafriend.herokuapp.com", "/categories");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final category = new CategoryRecipe.fromJson(item);
        items.add(category);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }
}

//comentario de prueba