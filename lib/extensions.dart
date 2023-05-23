import 'package:flutter/material.dart';

class Extensions {
  static const Color colorDark = Color.fromARGB(255, 27, 36, 48);
  static const Color colorSmooth1 = Color.fromARGB(255, 81, 85, 126);
  static const Color colorSmooth2 = Color.fromARGB(255, 129, 103, 151);
  static const Color colorBright = Color.fromARGB(255, 214, 213, 168);

  static const ButtonStyle buttonStyle1 = ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Extensions.colorDark),
              backgroundColor: MaterialStatePropertyAll(Extensions.colorBright),
              overlayColor: MaterialStatePropertyAll(Extensions.colorSmooth2),
            );

  static List<Widget> buildExtendedInputFieldAsList(
      String inputFieldText, RegExp validationExpression) {
    return [
      Container(
          margin: const EdgeInsets.all(10.0),
          child: Text(
            "$inputFieldText:",
            textAlign: TextAlign.center,
          )),
      Container(
          margin: const EdgeInsets.all(10.0),
          child: buildTextFormFieldWithValidator(
              inputFieldText, validationExpression))
    ];
  }

  static Row packageWidgetsAsRow(List<Widget> widgets) {
    return Row(children: widgets);
  }

  static Column packageWidgetsAsColumn(List<Widget> widgets) {
    return Column(children: widgets);
  }

  static TextFormField buildTextFormFieldWithValidator(
      String inputFieldText, RegExp validationExpression) {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) return "Input $inputFieldText";

          if (!Extensions.validation(value, validationExpression)) {
            return "Invalid $inputFieldText value";
          }
          return null;
        },
        initialValue: "");
  }

  static bool validation(String input, RegExp regularExpression) {
    return regularExpression.firstMatch(input) != null;
  }
}
