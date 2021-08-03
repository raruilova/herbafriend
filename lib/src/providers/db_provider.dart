import 'dart:io';

import 'package:herbafriend/src/model/personal_list.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }
  Future<Database> initDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    final path = join(appDir.path, 'herbaFriend.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE personalList(
          id  INTEGER PRIMARY KEY,
          name TEXT,          
          description TEXT,
          active BOOLEAN
        )      
      ''');
    });
  }

  Future<int> insert(PersonalList newElement) async {
    final db = await database;
    final newId = await db.insert('personalList', newElement.toJson());
    return newId;
  }

   Future<dynamic> list() async {
    final db = await database;
    final result = await db.query('personalList');
    return result.isNotEmpty
        ? result.map((t) => PersonalList.fromJson(t)).toList()
        : [];
  }
  //update 
  Future<int> updateList(PersonalList updateElement) async {
    //referencia base de datos
    final db = await database;
    //actualiza la tabla 
    return db.update(
      'personalList', updateElement.toJson(),
      where: '${updateElement.id} = ?',
      whereArgs:[updateElement.id]
    );
  }
  //delete 
  Future<int> deleteList(int? id) async {
    return await database.delete('personalList',
    where: 'id = ?',
    whereArgs: [id]
    );
  }
}