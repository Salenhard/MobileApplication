import 'package:flutter/material.dart';

class Extensions {
  static Row BuildExtendedInputFieldAsRow(
      String inputFieldText, RegExp regularExpression) {
    return Row(children: <Widget>[
      Container(
          margin: const EdgeInsets.all(10.0),
          child: Text(
            "$inputFieldText:",
            textAlign: TextAlign.center,
          )),
      Expanded(
          child: Container(
            margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return "Input $inputFieldText";

                    if (!Extensions.Validation(value, regularExpression)) {
                      return "Invalid $inputFieldText value";
                    }
                    return null;
                  },
                  initialValue: ""))),
    ]);
  }

  static bool Validation(String input, RegExp regularExpression) {
    return regularExpression.firstMatch(input) != null;
  }
}
