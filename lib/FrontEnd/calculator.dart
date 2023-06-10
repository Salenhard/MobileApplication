import 'package:flutter/material.dart';
import 'package:untitled4/Other/extensions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class ButtonsStyles {
  static const ButtonStyle control = ButtonStyle(
      shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
      backgroundColor: MaterialStatePropertyAll(Extensions.colorSmooth2),
      overlayColor: MaterialStatePropertyAll(Extensions.colorSmooth1));

  static const ButtonStyle operation = ButtonStyle(
      shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
      backgroundColor: MaterialStatePropertyAll(Extensions.colorSmooth1),
      overlayColor: MaterialStatePropertyAll(Extensions.colorSmooth2));

  static const ButtonStyle number = ButtonStyle(
      shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
      backgroundColor: MaterialStatePropertyAll(Extensions.colorDark),
      overlayColor: MaterialStatePropertyAll(Extensions.colorSmooth1));
}

class _CalculatorState extends State<Calculator> {
  final _clearExpression = "0";
  var _expresion = "0";

  Widget _buildCell({
    String? text,
    double textScaleFactor = 5,
    TextStyle textStyle = Extensions.textStyleUsual1,
    IconData? icon,
    double iconScalse = 2,
  }) {
    if (text != null) {
      return FittedBox(
        child: Text(
          text,
          style: textStyle,
          textScaleFactor: textScaleFactor,
        ),
      );
    } else {
      return Transform.scale(
        scale: iconScalse,
        child: Icon(
          icon,
          color: Extensions.colorBright,
        ),
      );
    }
  }

  Container _buildContainerAsCellBorder(
      {double widthMultiplier = 1,
      double heightMultiplier = 1,
      EdgeInsetsGeometry? padding,
      required Widget child}) {
    return Container(
      padding: padding,
      decoration: Extensions.containerBoxDecorationUsual1,
      width: MediaQuery.of(context).size.width * 0.25 * widthMultiplier,
      height: MediaQuery.of(context).size.height * 0.1 * heightMultiplier,
      child: child,
    );
  }

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Output

          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: FittedBox(
              child: Text(
                _expresion,
                style: Extensions.textStyleMainField1,
                textScaleFactor: 4,
              ),
            ),
          ),

          // Buttons - Input

          Column(
            children: [
              // First row: CA, Backspace, Division, Multiply

              Row(
                children: [
                  _buildContainerAsCellBorder(
                      child: OutlinedButton(
                          style: ButtonsStyles.control,
                          onPressed: () {
                            setState(() {
                              _expresion = _clearExpression;
                            });
                          },
                          child: _buildCell(
                              text: "CA",
                              textStyle: Extensions.textStyleMainField1))),
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.operation,
                        onPressed: () {
                          setState(() {
                            var len = _expresion.length;

                            if (len == 1) {
                              _expresion = _clearExpression;
                            } else {
                              _expresion = _expresion.substring(0, len - 1);
                            }
                          });
                        },
                        child: _buildCell(icon: Icons.backspace)),
                  ),
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.operation,
                        onPressed: () {
                          setState(() {
                            _expresion += "/";
                          });
                          // TODO: add operand/operation
                        },
                        child: _buildCell(text: "/", textScaleFactor: 3)),
                  ),
                  _buildContainerAsCellBorder(
                      child: OutlinedButton(
                          style: ButtonsStyles.operation,
                          onPressed: () {
                            setState(() {
                              _expresion += "*";
                            });
                            // TODO: add operand/operation
                          },
                          child: _buildCell(icon: Icons.clear))),
                ],
              ),

              // Second row: 7, 8, 9, Substraction

              Row(
                children: [
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.number,
                        onPressed: () {
                          setState(() {
                            _expresion += "7";
                          });
                          // TODO: add operand/operation
                        },
                        child: _buildCell(text: "7", textScaleFactor: 4)),
                  ),
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.number,
                        onPressed: () {
                          setState(() {
                            _expresion += "8";
                          });
                          // TODO: add operand/operation
                        },
                        child: _buildCell(text: "8", textScaleFactor: 4)),
                  ),
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.number,
                        onPressed: () {
                          setState(() {
                            _expresion += "9";
                          });
                          // TODO: add operand/operation
                        },
                        child: _buildCell(text: "9", textScaleFactor: 4)),
                  ),
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.operation,
                        onPressed: () {
                          setState(() {
                            _expresion += "-";
                          });
                          // TODO: add operand/operation
                        },
                        child: _buildCell(
                            text: "-",
                            textStyle: Extensions.textStyleMainField1)),
                  ),
                ],
              ),

              // Thrird row: 4, 5, 6, Adding

              Row(
                children: [
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.number,
                        onPressed: () {
                          setState(() {
                            _expresion += "4";
                          });
                          // TODO: add operand/operation
                        },
                        child: _buildCell(text: "4", textScaleFactor: 4)),
                  ),
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.number,
                        onPressed: () {
                          setState(() {
                            _expresion += "5";
                          });
                          // TODO: add operand/operation
                        },
                        child: _buildCell(text: "5", textScaleFactor: 4)),
                  ),
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.number,
                        onPressed: () {
                          setState(() {
                            _expresion += "6";
                          });
                          // TODO: add operand/operation
                        },
                        child: _buildCell(text: "6", textScaleFactor: 4)),
                  ),
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.operation,
                        onPressed: () {
                          setState(() {
                            _expresion += "+";
                          });
                          // TODO: add operand/operation
                        },
                        child: _buildCell(text: "+")),
                  ),
                ],
              ),

              // Fourth row: Column {Row {1, 2}, 0}, Row {Column {3, '.'}, GetResult ('=')}

              Row(
                children: [
                  // { 1, 2 }, 0

                  Column(
                    children: [
                      // 1, 2

                      Row(
                        children: [
                          _buildContainerAsCellBorder(
                            child: OutlinedButton(
                                style: ButtonsStyles.number,
                                onPressed: () {
                                  // TODO: add operand/operation
                                },
                                child:
                                    _buildCell(text: "1", textScaleFactor: 4)),
                          ),
                          _buildContainerAsCellBorder(
                            child: OutlinedButton(
                                style: ButtonsStyles.number,
                                onPressed: () {
                                  // TODO: add operand/operation
                                },
                                child:
                                    _buildCell(text: "2", textScaleFactor: 4)),
                          ),
                        ],
                      ),

                      // 0

                      _buildContainerAsCellBorder(
                        widthMultiplier: 2,
                        child: OutlinedButton(
                            style: ButtonsStyles.number,
                            onPressed: () {
                              // TODO: add operand/operation
                            },
                            child: _buildCell(text: "0", textScaleFactor: 4)),
                      ),
                    ],
                  ),

                  // { 3, '.' }, '='

                  Row(
                    children: [
                      // 3, '.'

                      Column(
                        children: [
                          _buildContainerAsCellBorder(
                            child: OutlinedButton(
                                style: ButtonsStyles.number,
                                onPressed: () {
                                  setState(() {
                                    _expresion += "3";
                                  });
                                  // TODO: add operand/operation
                                },
                                child:
                                    _buildCell(text: "3", textScaleFactor: 4)),
                          ),
                          _buildContainerAsCellBorder(
                            child: OutlinedButton(
                                style: ButtonsStyles.number,
                                onPressed: () {
                                  setState(() {
                                    _expresion += ".";
                                  });
                                  // TODO: add operand/operation
                                },
                                child: _buildCell(
                                    text: ".",
                                    textStyle: Extensions.textStyleMainField1)),
                          ),
                        ],
                      ),

                      // '='

                      _buildContainerAsCellBorder(
                        heightMultiplier: 2,
                        child: OutlinedButton(
                            style: ButtonsStyles.control,
                            onPressed: () {
                              // TODO: add operand/operation
                            },
                            child: _buildCell(text: "=")),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          //       OutlinedButton(
          //           style: Extensions.buildSimpleButtonElevatedStyle(
          //               overlayColor: Extensions.colorSmooth1),
          //           onPressed: () {
          //             // TODO: add operand/operation
          //           },
          //           child: const FittedBox(
          //             child: Text(
          //               "8",
          //               style: Extensions.textStyleUsual1,
          //               textScaleFactor: 5,
          //             ),
          //           )),
          //       OutlinedButton(
          //           style: Extensions.buildSimpleButtonElevatedStyle(
          //               overlayColor: Extensions.colorSmooth1),
          //           onPressed: () {
          //             // TODO: add operand/operation
          //           },
          //           child: const FittedBox(
          //             child: Text(
          //               "9",
          //               style: Extensions.textStyleUsual1,
          //               textScaleFactor: 5,
          //             ),
          //           )),
          //       OutlinedButton(
          //           style: Extensions.buttonElevatedStyleUsual1,
          //           onPressed: () {
          //             // TODO: add operand/operation
          //           },
          //           child: const FittedBox(
          //             child: Text(
          //               "-",
          //               style: Extensions.textStyleUsual1,
          //               textScaleFactor: 5,
          //             ),
          //           )),
          //     ]),
          //     TableRow(children: [
          //       OutlinedButton(
          //           style: Extensions.buildSimpleButtonElevatedStyle(
          //               overlayColor: Extensions.colorSmooth1),
          //           onPressed: () {
          //             // TODO: add operand/operation
          //           },
          //           child: const FittedBox(
          //             child: Text(
          //               "4",
          //               style: Extensions.textStyleUsual1,
          //               textScaleFactor: 5,
          //             ),
          //           )),
          //       OutlinedButton(
          //           style: Extensions.buildSimpleButtonElevatedStyle(
          //               overlayColor: Extensions.colorSmooth1),
          //           onPressed: () {
          //             // TODO: add operand/operation
          //           },
          //           child: const FittedBox(
          //             child: Text(
          //               "5",
          //               style: Extensions.textStyleUsual1,
          //               textScaleFactor: 5,
          //             ),
          //           )),
          //       OutlinedButton(
          //           style: Extensions.buildSimpleButtonElevatedStyle(
          //               overlayColor: Extensions.colorSmooth1),
          //           onPressed: () {
          //             // TODO: add operand/operation
          //           },
          //           child: const FittedBox(
          //             child: Text(
          //               "6",
          //               style: Extensions.textStyleUsual1,
          //               textScaleFactor: 5,
          //             ),
          //           )),
          //       OutlinedButton(
          //           style: Extensions.buttonElevatedStyleUsual1,
          //           onPressed: () {
          //             // TODO: add operand/operation
          //           },
          //           child: const FittedBox(
          //             child: Text(
          //               "+",
          //               style: Extensions.textStyleUsual1,
          //               textScaleFactor: 5,
          //             ),
          //           )),
          //     ]),
          //   ],
          // ),
        ],
      ),
      // Wrap(
      //   direction: Axis.vertical,
      //   alignment: WrapAlignment.start,
      //   children: [

      //   ],
      // ),
    );
  }
}
