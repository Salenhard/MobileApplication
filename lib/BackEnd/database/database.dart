import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'client_model.dart';

class ClientsDatabaseController {
  ClientsDatabaseController._privateConstructor();
  static final ClientsDatabaseController instance = ClientsDatabaseController._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initdatabase();

  Future<Database> _initdatabase() async {
    // Directory documentsDiretory = await getApplicationDocumentsDirectory();
    var dataBasesPath = await getDatabasesPath();

    // String path = join(documentsDiretory.path, "Clients.db");
    String path = join(dataBasesPath, "Clients.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE Clients("
        "id INTEGER PRIMARY KEY, "
        "name TEXT, "
        "mail TEXT, "
        "password TEXT, "
        "age INTEGER"
        ")");
  }

  Future getClients() async {
    
  }

  Future searchByMail(String mail) async {
    
  }

  Future<int> add(Client client) async {
    Database db = await instance.database;
    return await db.insert(ClientFields.tableName, client.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete("Clients", where: "id = ?", whereArgs: [id]);
  }

  Future update(Client client) async {
  }
}
