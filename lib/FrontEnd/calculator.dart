import 'package:flutter/material.dart';
import 'package:untitled4/Other/extensions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _expresion = "0";
  final _result = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Extensions.colorDark,
        appBar: AppBar(
          backgroundColor: Extensions.colorSmooth1,
          shadowColor: Colors.transparent,
          title: const Text(
            "Simple caclulator.",
            style: Extensions.textStyleMainField1,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                        color: Extensions.colorSmooth2,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: FittedBox(
                          child: Text(
                            _expresion,
                            textAlign: TextAlign.right,
                            style: Extensions.textStyleMainField1,
                          ),
                        )),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: FittedBox(
                          child: Text(
                            _result,
                            textAlign: TextAlign.right,
                            style: Extensions.textStyleMainField1,
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
        )
        // Wrap(
        //   direction: Axis.vertical,
        //   alignment: WrapAlignment.start,
        //   children: [

        //   ],
        // ),
        );
  }
}
