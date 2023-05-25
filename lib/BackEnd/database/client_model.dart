class Client {
  int id = 0;
  String name;
  String mail;
  String password;
  int age;

  Client({
    required this.name,
    required this.mail,
    required this.password,
    required this.age,
  });

  Map<String, Object> toMap() => {
        "id": id,
        "name": name,
        "mail": mail,
        "password": password,
        "age": age,
      };
}

class ClientFields {
  static const String tableName = "clients";
  static const String id = "_id";
  static const String name = "name";
  static const String mail = "mail";
  static const String password = "password";
  static const String age = "age";
}
