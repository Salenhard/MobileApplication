import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'client_model.dart';

class ClientsDataBase {
  static Future<Database>? _dataBase;
  static Client? user;

  static init() async {
    _dataBase = open();
  }

  static Future<Database> open() async {
    if (_dataBase != null) {
      return _dataBase!;
    }

    var dataBasePath = await getDatabasesPath();
    var path = join(dataBasePath, '${ClientFields.tableName}.db');

    return await openDatabase(path, onCreate: create, version: 1);
  }

  static Future create(Database db, int version) async {
    var idType = "INTEGER PRIMARY KEY AUTOINCREMENT";

    await db.execute('''
CREATE TABLE IF NOT EXISTS ${ClientFields.tableName} (
  ${ClientFields.id} $idType,
  ${ClientFields.name} TEXT,
  ${ClientFields.mail} TEXT,
  ${ClientFields.password} TEXT
)
''');
  }

  static Future<Client> findClientByID(int id) async {
    var db = await _dataBase!;

    return Client.fromMap((await db.query(ClientFields.tableName,
            where: '${ClientFields.id} = ?', whereArgs: [id]))
        .first);
  }

  static Future clear() async {
    var db = await _dataBase!;
    user = null;

    await db.rawDelete("DELETE FROM ${ClientFields.tableName}");
  }

  static Future insert(Client client) async {
    var db = await _dataBase!;

    var id = await db.insert(ClientFields.tableName, client.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    user = client;
    user!.id = id;
  }

  static Future deleteClient(Client client) async {
    var db = await _dataBase!;

    await db.delete(ClientFields.tableName,
        where: '${ClientFields.id} = ?', whereArgs: [client.id]);
  }

  static Future updateCliend(Client client) async {
    var db = await _dataBase!;

    user = client;

    await db.update(ClientFields.tableName, client.toMap(),
        where: '${ClientFields.id} = ?',
        whereArgs: [client.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<bool> isThereClientByMail(String mail) async {
    var db = await _dataBase!;

    return (await db.query(ClientFields.tableName,
            where: '${ClientFields.mail} = ?', whereArgs: [mail]))
        .isNotEmpty;
  }

  static Future<bool> isThereClientByLoginInfo(
      String mail, String password) async {
    var db = await _dataBase!;

    var findedClients = await db.query(ClientFields.tableName,
        where: '${ClientFields.mail} = ? AND ${ClientFields.password} = ?',
        whereArgs: [mail, password]);

    if (findedClients.isNotEmpty) {
      user = Client.fromMap(findedClients.first);
      return true;
    }

    return false;
  }
}
