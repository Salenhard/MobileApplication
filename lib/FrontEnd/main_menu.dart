import 'package:flutter/material.dart';
import 'package:untitled4/FrontEnd/calculator.dart';
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
        body: const [MainForm(), Calculator()][currentPageIndex],
      ),
    );
  }
}

class MainForm extends StatelessWidget {
  const MainForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          // Title

          Container(
            margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 10),
            alignment: Alignment.centerLeft,
            child: Text("Hi, ${ClientsDataBase.user!.name}.",
                style: Extensions.textStyleMainField1, textScaleFactor: 4),
          ),
        ],
      ),
    ));
  }
}
