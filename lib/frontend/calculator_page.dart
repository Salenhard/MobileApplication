import 'package:flutter/material.dart';
import 'package:untitled4/Other/extensions.dart';
import 'package:untitled4/backend/calculator/calculator.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
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

class _CalculatorPageState extends State<CalculatorPage> {
  var _expresion = "0";
  String _numberBuffer = "0";

  final _calculator = Calculator();

  double get _popNumber {
    var res = double.parse(_numberBuffer);
    _numberBuffer = "";
    return res;
  }

  void _pushOperation(Operations operation) {
    setState(() {
      if (_numberBuffer.isEmpty && _expresion.isNotEmpty) {
        _replaceLastExpresionOperation(operation);
      } else {
        _calculator.pushOperand(_popNumber);
        _calculator.pushOperation(operation);
        _expresion += Operation.operationsToString[operation]!;
      }
    });
  }

  void _pushOperand(double number) {
    var num = _clearTrailingZero(number);

    setState(() {
      if (_numberBuffer == "0") {
        _numberBuffer = num;
        _expresion = _expresion.substring(0, _expresion.length - 1);
      } else {
        _numberBuffer += num;
      }

      _expresion += num;
    });
  }

  String _clearTrailingZero(double number) {
    return number.toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');
  }

  void _pushDot() {
    if (!_numberBuffer.contains(".")) {
      _numberBuffer += ".";
      _expresion += ".";
    }
  }

  void _replaceLastExpresionOperation(Operations newOperation) {
    setState(() {
      _expresion = _expresion.substring(0, _expresion.length - 1);
      _expresion += Operation.operationsToString[newOperation]!;
      _calculator.popOperation;
      _calculator.pushOperation(newOperation);
    });
  }

  void _backslash() {
    setState(() {
      var len = _expresion.length;
      var lastSymbol = _expresion[len - 1];

      if (len <= 1) {
        _expresion = _numberBuffer = "0";
        return;
      }
      _expresion = _expresion.substring(0, len - 1);

      if (Operation.operationsInString.contains(lastSymbol)) {
        _numberBuffer = _clearTrailingZero(_calculator.peekOperand);
      }
    });
  }

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
    void getAnswer() {
      // TODO: Try to fix observer effect

      setState(() {
        try {
          if (_numberBuffer.isNotEmpty) {
            _calculator.pushOperand(_popNumber);
          }

          var answer = _clearTrailingZero(_calculator.answer);

          _expresion = _numberBuffer = answer;
        } catch (e) {
          ScaffoldMessenger.of(context)
              .showSnackBar(Extensions.getSnackBar("Error: $e"));

          _calculator.clear();
          _expresion = _numberBuffer = "0";
        }
      });
    }

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
                              _calculator.clear();
                              _expresion = _numberBuffer = "0";
                            });
                          },
                          child: _buildCell(
                              text: "CA",
                              textStyle: Extensions.textStyleMainField1))),
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.operation,
                        onPressed: () {
                          _backslash();
                        },
                        child: _buildCell(icon: Icons.backspace)),
                  ),
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.operation,
                        onPressed: () {
                          _pushOperation(Operations.division);
                        },
                        child: _buildCell(text: "/", textScaleFactor: 3)),
                  ),
                  _buildContainerAsCellBorder(
                      child: OutlinedButton(
                          style: ButtonsStyles.operation,
                          onPressed: () {
                            _pushOperation(Operations.multiplication);
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
                          _pushOperand(7);
                        },
                        child: _buildCell(text: "7", textScaleFactor: 4)),
                  ),
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.number,
                        onPressed: () {
                          _pushOperand(8);
                        },
                        child: _buildCell(text: "8", textScaleFactor: 4)),
                  ),
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.number,
                        onPressed: () {
                          _pushOperand(9);
                        },
                        child: _buildCell(text: "9", textScaleFactor: 4)),
                  ),
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.operation,
                        onPressed: () {
                          _pushOperation(Operations.subtraction);
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
                          _pushOperand(4);
                        },
                        child: _buildCell(text: "4", textScaleFactor: 4)),
                  ),
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.number,
                        onPressed: () {
                          _pushOperand(5);
                        },
                        child: _buildCell(text: "5", textScaleFactor: 4)),
                  ),
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.number,
                        onPressed: () {
                          _pushOperand(6);
                        },
                        child: _buildCell(text: "6", textScaleFactor: 4)),
                  ),
                  _buildContainerAsCellBorder(
                    child: OutlinedButton(
                        style: ButtonsStyles.operation,
                        onPressed: () {
                          _pushOperation(Operations.addition);
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
                                  _pushOperand(1);
                                },
                                child:
                                    _buildCell(text: "1", textScaleFactor: 4)),
                          ),
                          _buildContainerAsCellBorder(
                            child: OutlinedButton(
                                style: ButtonsStyles.number,
                                onPressed: () {
                                  _pushOperand(2);
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
                              _pushOperand(0);
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
                                  _pushOperand(3);
                                },
                                child:
                                    _buildCell(text: "3", textScaleFactor: 4)),
                          ),
                          _buildContainerAsCellBorder(
                            child: OutlinedButton(
                                style: ButtonsStyles.number,
                                onPressed: () {
                                  _pushDot();
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
                              getAnswer();
                            },
                            child: _buildCell(text: "=")),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
