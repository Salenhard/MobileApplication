import 'package:flutter/material.dart';
import 'package:untitled4/BackEnd/database/data_base.dart';
import 'FrontEnd/login_menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ClientsDataBase.init();
  
  runApp(const LoginMenu());
}
