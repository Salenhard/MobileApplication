import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'client_model.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();


late Database _database;
Future<Database> get database async {
  if (_database != null) {
    return _database;
  }

  // if _database is null we instantiate it
  _database = await initDB();
  return _database;
}

initDB() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, "TestDB.db");
  return await openDatabase(path, version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE Client ("
            "id INTEGER PRIMARY KEY,"
            "name TEXT,"
            "mail TEXT,"
            "password TEXT"
            ")");
      });
}
  newClient(Client newClient) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Client");
    Object? id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Client (id,name,mail,password,age)"
            " VALUES (?,?,?,?,?)",
        [id, newClient.name, newClient.mail, newClient.password, newClient.age]);
    return raw;
  }

  getClient(int id) async {
    final db = await database;
    var res = await  db.query("Client", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Client.fromJson(res.first) : Null ;
  }

  getAllClients() async {
    final db = await database;
    var res = await db.query("Client");
    List list =
    res.isNotEmpty ? res.map((c) => Client.fromJson(c)).toList() : [];
    return list;
  }

  updateClient(Client newClient) async {
    final db = await database;
    var res = await db.update("Client", newClient.toJson(),
        where: "id = ?", whereArgs: [newClient.id]);
    return res;
  }
}


