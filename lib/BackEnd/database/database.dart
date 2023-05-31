import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'client_model.dart';

class ClientsDataBase {
  static Future<Database>? _dataBase;

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
  ${ClientFields.password} TEXT,
  ${ClientFields.age} INTEGER,
)
''');
  }

  static Future<int> insert(Client client) async {
    var db = await _dataBase!;

    return db.insert(ClientFields.tableName, client.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future deleteClient(Client client) async {
    var db = await _dataBase!;

    await db.delete(ClientFields.tableName,
        where: '${ClientFields.id} = ?', whereArgs: [client.id]);
  }

  static Future updateCliend(Client client) async {
    var db = await _dataBase!;

    await db.update(ClientFields.tableName, client.toMap(),
        where: '${ClientFields.id} = ?',
        whereArgs: [client.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<bool> isThereClientByLoginInfo(
      String mail, String password) async {
    var db = await _dataBase!;

    return (await db.query(ClientFields.tableName,
            where: '${ClientFields.mail} = ?, ${ClientFields.password} = ?',
            whereArgs: [mail, password]))
        .isNotEmpty;
  }
}
