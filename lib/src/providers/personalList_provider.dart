  
import 'package:flutter/material.dart';
import 'package:herbafriend/src/model/personal_list.dart';

import 'db_provider.dart';

class PersonalListProvider extends ChangeNotifier {
  List<PersonalList> elements = [];

  Future<PersonalList> addElement(String name, String description) async {
    PersonalList element = PersonalList(name: name, description: description);
    final id = await DBProvider.db.insert(element);
    element.id = id;
    this.elements.add(element);
    notifyListeners();
    return element;
  }

  loadElements() async {
    final travelsQuery = await DBProvider.db.list();
    this.elements = [...travelsQuery];
    notifyListeners();
  }
}