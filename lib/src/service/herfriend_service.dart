import 'dart:convert';
import 'dart:io';

import 'package:herbafriend/src/model/herbafriend_model.dart';
import 'package:http/http.dart' as http;
import 'package:cloudinary_public/cloudinary_public.dart';

class HerbaFriendService {
  HerbaFriendService();

  //Future, indica que es una llama asíncrona
  Future<List<Recipes>> getRecipes() async {
    List<Recipes> items = [];
    try {
      var uri = Uri.https("backhebrafriend.herokuapp.com", "/recipes");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final recipe = new Recipes.fromJson(item);
        items.add(recipe);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }

  //send recepis
  Future<dynamic> sendRecipe(Recipes recipe) async {
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      var uri = Uri.https("backhebrafriend.herokuapp.com", "/recipes");
      final resp =
          await http.post(uri, headers: _headers, body: recipesToJson(recipe));
      if (resp.body.isEmpty) return null;
      return json.decode(resp.body);
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

  Future<String> upImage(File image) async {
    final cloudinary =
        CloudinaryPublic('dm9qu6n5c', 'ml_default', cache: false);
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image),
      );
      return response.secureUrl;
    } on CloudinaryException catch (e) {
      print(e.message);
      print(e.request);
      return "";
    }
  }
}
