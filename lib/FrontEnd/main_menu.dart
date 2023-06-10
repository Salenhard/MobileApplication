import 'package:flutter/material.dart';
import 'package:untitled4/FrontEnd/calculator_page.dart';
import '../BackEnd/database/data_base.dart';
import '../Other/extensions.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<StatefulWidget> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int currentPageIndex = 0;

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
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home, color: Extensions.colorSmooth2),
                label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.calculate, color: Extensions.colorSmooth2),
                label: "Calculator")
          ],
        ),
        backgroundColor: Extensions.colorDark,
        body: const [MainPage(), CalculatorPage()][currentPageIndex],
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
