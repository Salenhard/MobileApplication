import 'package:flutter/material.dart';

class Extensions {
  // Color palette: https://colorhunt.co/palette/1b243051557e816797d6d5a8
  static const Color colorDark = Color.fromARGB(255, 27, 36, 48);
  static const Color colorSmooth1 = Color.fromARGB(255, 81, 85, 126);
  static const Color colorSmooth2 = Color.fromARGB(255, 129, 103, 151);
  static const Color colorBright = Color.fromARGB(255, 214, 213, 168);

  static const ButtonStyle buttonStyleUsual1 = ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Extensions.colorSmooth1),
      overlayColor: MaterialStatePropertyAll(Extensions.colorSmooth2),
      textStyle: MaterialStatePropertyAll(TextStyle(
        color: Extensions.colorBright,
      )));

  static const TextStyle textStyleMainField1 =
      TextStyle(color: colorBright, fontWeight: FontWeight.bold);

  static InputDecoration getTextFormFieldDecoration1(String inputFieldText) {
    return InputDecoration(
        labelText: 'Enter your $inputFieldText',
        labelStyle: const TextStyle(color: colorSmooth1),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(color: colorSmooth1)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)));
  }

  static Row packageWidgetsAsRow(List<Widget> widgets) {
    return Row(children: widgets);
  }

  static Column packageWidgetsAsColumn(List<Widget> widgets) {
    return Column(children: widgets);
  }

  static TextFormField getTextFormFieldWithValidator(String inputFieldText,
      RegExp validationExpression, InputDecoration decoration) {
    return TextFormField(
      autofillHints: Characters("Input $inputFieldText here..."),
      validator: (value) {
        if (value!.isEmpty) {
          return "Input $inputFieldText";
        }
        if (!Extensions.validation(value, validationExpression)) {
          return "Invalid $inputFieldText value";
        }
        return null;
      },
      decoration: decoration,
      style: const TextStyle(color: colorSmooth2),
      textAlignVertical: TextAlignVertical.center,
    );
  }

  static bool validation(String input, RegExp regularExpression) {
    return regularExpression.firstMatch(input) != null;
  }
}
