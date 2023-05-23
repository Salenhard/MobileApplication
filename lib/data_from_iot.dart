import 'package:flutter/material.dart';
import 'application.dart';

class DataFromIOT extends StatefulWidget{
  const DataFromIOT({super.key});

  @override
  createState() => DataFromIOTState();
}

class DataFromIOTState extends State<DataFromIOT>{
  @override
  build(BuildContext context){
    return Column(
      children: [
        Container(
          child: const Menu(),
        )
      ],
    );
  }
}