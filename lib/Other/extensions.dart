import 'package:flutter/material.dart';

class Extensions {
  // Color palette: https://colorhunt.co/palette/1b243051557e816797d6d5a8
  static const Color colorDark = Color.fromARGB(255, 27, 36, 48);
  static const Color colorSmooth1 = Color.fromARGB(255, 81, 85, 126);
  static const Color colorSmooth2 = Color.fromARGB(255, 129, 103, 151);
  static const Color colorSmooth3 = Color.fromARGB(255, 105, 105, 105);
  static const Color colorBright = Color.fromARGB(255, 214, 213, 168);

  static const ButtonStyle buttonElevatedStyleUsual1 = ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Extensions.colorSmooth1),
      overlayColor: MaterialStatePropertyAll(Extensions.colorSmooth2));

  static const ButtonStyle buttonElevatedStyleUsual2 = ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.transparent),
      shadowColor: MaterialStatePropertyAll(Colors.transparent),
      overlayColor: MaterialStatePropertyAll(Extensions.colorSmooth1),
      side:
          MaterialStatePropertyAll(BorderSide(color: Extensions.colorSmooth1)));

  static const TextStyle textStyleMainField1 =
      TextStyle(color: colorBright, fontWeight: FontWeight.bold);

  static const TextStyle textStyleUsual1 = TextStyle(color: colorBright);

  static InputDecoration getTextFormFieldDecoration1(String inputFieldText) {
    return InputDecoration(
        labelText: 'Enter your $inputFieldText',
        labelStyle: const TextStyle(color: colorSmooth1),
        enabledBorder: inputFieldBorder1,
        border: inputFieldBorder1);
  }

  static OutlineInputBorder inputFieldBorder1 = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(color: colorSmooth1));

  static Row packageWidgetsAsRow(List<Widget> widgets) {
    return Row(children: widgets);
  }

  static Column packageWidgetsAsColumn(List<Widget> widgets) {
    return Column(children: widgets);
  }

  static TextFormField getTextFormFieldWithValidator(
      String inputFieldText,
      RegExp validationExpression,
      TextEditingController textController,
      InputDecoration decoration) {
    return TextFormField(
      controller: textController,
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

  static Column getFullInputFieldAsColumn(String inputFieldText,
      RegExp validationExpression, TextEditingController textController,
      {double marginHorizontal = 35, double distanceFloating = 5}) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(
              vertical: distanceFloating, horizontal: marginHorizontal),
          child: Text(
            "$inputFieldText:",
            style: Extensions.textStyleUsual1,
            textScaleFactor: 1.25,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: marginHorizontal, vertical: distanceFloating),
          child: Extensions.getTextFormFieldWithValidator(
              inputFieldText.toLowerCase(),
              validationExpression,
              textController,
              InputDecoration(
                  enabledBorder: inputFieldBorder1, border: inputFieldBorder1)),
        ),
      ],
    );
  }
}
