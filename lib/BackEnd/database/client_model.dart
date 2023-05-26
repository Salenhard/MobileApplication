class Client {
  int id = 0;
  String name;
  String mail;
  String password;
  int age;

  Client({
    this.id = 0,
    required this.name,
    required this.mail,
    required this.password,
    required this.age,
  });

  Map<String, Object> toMap() => {
        ClientFields.id: id,
        ClientFields.name: name,
        ClientFields.mail: mail,
        ClientFields.password: password,
        ClientFields.age: age,
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
