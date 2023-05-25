import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'client_model.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initdatabase();

  Future<Database> _initdatabase() async {
    Directory documentsDiretory = await getApplicationDocumentsDirectory();

    String path = join(documentsDiretory.path, "Clients.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      );
  }
  Future _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Clients("
            "id INTEGER PRIMARY KEY, "
            "name TEXT, "
            "mail TEXT, "
            "password TEXT, "
            "age INTEGER"
            ")"
    );
  }

  Future<List<Client>> getClients() async {
    Database db = await instance.database;
    var clients = await db.query("Clients", orderBy: "id");
    List<Client> clientlist = clients.isNotEmpty ? clients.map((c) => Client.fromJson(c)).toList() : [];
    return clientlist;
  }

  Future<Client> searchByMail(String mail) async {
    Database db = await instance.database;
    var clients = await db.query("Clients", where: "mail = ?", whereArgs: [mail]);
    List<Client> clientlist = clients.isNotEmpty ? clients.map((c) => Client.fromJson(c)).toList() : [];
    Client client = clientlist[0];
    return client;
  }

  Future<int> add(Client client) async {
    Database db = await instance.database;
    var clients = await db.query("Clients", orderBy: "id");
    List<Client> clientlist = clients.isNotEmpty ? clients.map((c) => Client.fromJson(c)).toList() : [];
    int id = clientlist.length + 1;
    client.id = id;
    return await db.insert("Clients", client.toJson());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete("Clients", where: "id = ?", whereArgs: [id]);
  }

  Future<int> update(Client client) async {
    Database db = await instance.database;
    return await db.update("Clients", client.toJson(), where: 'id = ?', whereArgs: [client.id]);
  }
}

