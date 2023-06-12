import 'package:flutter/material.dart';
import 'package:untitled4/FrontEnd/calculator_page.dart';
import 'package:untitled4/frontend/weather_page.dart';
import 'package:untitled4/BackEnd/database/data_base.dart';
import 'package:untitled4/Other/extensions.dart';
import 'package:untitled4/frontend/profile_page.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<StatefulWidget> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int currentPageIndex = 0;

  NavigationDestination _getDestination(String label, IconData icon) {
    return NavigationDestination(
      label: label,
      icon: Icon(icon, color: Extensions.colorBright),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          backgroundColor: Extensions.colorSmooth1,
          indicatorColor: Extensions.colorDark,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (newIndex) {
            setState(() {
              currentPageIndex = newIndex;
            });
          },
          destinations: [
            _getDestination("Home", Icons.home),
            _getDestination("Calculator", Icons.calculate),
            _getDestination("Weather", Icons.wb_cloudy),
            // EoT here
            _getDestination("Profile", Icons.person),
          ],
        ),
        backgroundColor: Extensions.colorDark,
        body: const [
          MainPage(),
          CalculatorPage(),
          WeatherPage(),
          // EoT here
          ProfilePage(),
        ][currentPageIndex],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Center(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          alignment: Alignment.centerLeft,
          child: FittedBox(
            child: Text("Hi, ${ClientsDataBase.user!.name}.",
                style: Extensions.textStyleMainField1, textScaleFactor: 4),
          )),
    ));
  }
}
