import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'client_model.dart';

class ClientsDataBase {
  Future<Database>? _dataBase;

  ClientsDataBase() {
    _dataBase = openDB();
  }

  Future<Database> openDB(
      {String fileFullName = '${ClientFields.tableName}.db'}) async {
    if (_dataBase != null) {
      return _dataBase!;
    }

    var dataBasePath = await getApplicationDocumentsDirectory();
    var path = join(dataBasePath.path, fileFullName);

    return await openDatabase(path, onCreate: createDB, version: 1);
  }

  Future createDB(Database db, int version) async {
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

  Future<int> insertInDB(Client client) async {
    var db = await _dataBase!;

    return db.insert(ClientFields.tableName, client.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future deleteFromDB(Client client) async {
    var db = await _dataBase!;

    await db.delete(ClientFields.tableName,
        where: '${ClientFields.id} = ?', whereArgs: [client.id]);
  }

  Future updateDB(Client client) async {
    var db = await _dataBase!;

    await db.update(ClientFields.tableName, client.toMap(),
        where: '${ClientFields.id} = ?',
        whereArgs: [client.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<bool> isThereClientByLoginInfo(String mail, String password) async {
    var db = await _dataBase!;

    return (await db.query(ClientFields.tableName,
            where: '${ClientFields.mail} = ?, ${ClientFields.password} = ?',
            whereArgs: [mail, password]))
        .length > 0;
  }
}
