import 'dart:convert';

Client clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Client.fromJson(jsonData);
}

String clientToJson(Client data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Client {
  int id;
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

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    id: json["id"],
    name: json["name"],
    mail: json["mail"],
    password: json["password"],
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mail": mail,
    "password": password,
    "age": age,
  };
}