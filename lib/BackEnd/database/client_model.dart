class Client {
  int id = 0;
  String name;
  String mail;
  String password;

  Client({
    this.id = 0,
    required this.name,
    required this.mail,
    required this.password,
  });

  Map<String, Object> toMap() => {
        ClientFields.id: id,
        ClientFields.name: name,
        ClientFields.mail: mail,
        ClientFields.password: password,
      };

  static Client fromMap(Map<String, Object?> map) {
    return Client(
        id: map[ClientFields.id] as int,
        name: map[ClientFields.name] as String,
        mail: map[ClientFields.mail] as String,
        password: map[ClientFields.password] as String);
  }
}

class ClientFields {
  static const String tableName = "clients";

  static const String id = "_id";
  static const String name = "name";
  static const String mail = "mail";
  static const String password = "password";
}
