import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'client_model.dart';

class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
            "CREATE TABLE Clients(id INTEGER PRIMARY KEY AUTOINCREMENT,"
                "name TEXT,"
                "mail TEXT,"
                "password TEXT,"
                "age INTEGER"
                ")",
        );
      },
      version: 1,
    );
  }

  Future<int> createItem(Client client) async {
    int result = 0;
    final Database db = await initializeDB();
    final id = await db.insert(
        'Clients', client.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    result =1;
    return result;
  }


  getClient(int id) async {
    final db = await initializeDB();
    var res = await  db.query("Client", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Client.fromJson(res.first) : Null ;
  }

  Future<List<Client>> getItems() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
    await db.query('Client', orderBy: "id");
    return queryResult.map((e) => Client.fromJson(e)).toList();
  }

  updateClient(Client newClient) async {
    final db = await initializeDB();
    var res = await db.update("Client", newClient.toJson(),
        where: "id = ?", whereArgs: [newClient.id]);
    return res;
  }
}


