import 'package:flutter/material.dart';

class Extensions {
  // Color palette: https://colorhunt.co/palette/1b243051557e816797d6d5a8
  static const Color colorDark = Color.fromARGB(255, 27, 36, 48);
  static const Color colorSmooth1 = Color.fromARGB(255, 81, 85, 126);
  static const Color colorSmooth2 = Color.fromARGB(255, 129, 103, 151);
  static const Color colorBright = Color.fromARGB(255, 214, 213, 168);

  static const ButtonStyle buttonElevatedStyleUsual1 = ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(Extensions.colorSmooth1),
    overlayColor: MaterialStatePropertyAll(Extensions.colorSmooth2),
  );

  static const ButtonStyle buttonElevatedStyleUsual2 = ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.transparent),
      shadowColor: MaterialStatePropertyAll(Colors.transparent),
      overlayColor: MaterialStatePropertyAll(Extensions.colorSmooth1),
      side:
          MaterialStatePropertyAll(BorderSide(color: Extensions.colorSmooth1)));

  static RegExp passwordRegExp =
      RegExp(r'^(?=.*[^ ])(?=.*?[A-ZА-Я])(?=.*?[a-zа-я])(?=.*?[0-9]).{8,}$');

  static RegExp mailRegExp = RegExp(r'(.+)+(@)+(.{1})+(\.)+.+');

  static RegExp emptyRegExp = RegExp('r.+');

  static const TextStyle textStyleHintUsual1 =
      TextStyle(color: colorSmooth1, fontSize: 12);

  static ButtonStyle buildSimpleButtonElevatedStyle(
      {Color backgroundColor = Colors.transparent,
      Color overlayColor = Colors.transparent,
      OutlinedBorder? shape}) {
    return ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        overlayColor: MaterialStatePropertyAll(overlayColor),
        shape: MaterialStatePropertyAll(shape));
  }

  static const TextStyle textStyleMainField1 =
      TextStyle(color: colorBright, fontWeight: FontWeight.bold);

  static const TextStyle textStyleMainField2 =
      TextStyle(color: colorDark, fontWeight: FontWeight.bold);

  static AppBar getAppBarUsual1(String title) {
    return AppBar(
      backgroundColor: Extensions.colorSmooth1,
      shadowColor: Colors.transparent,
      title: Text(
        title,
        style: Extensions.textStyleMainField1,
      ),
    );
  }

  static const TextStyle textStyleUsual1 = TextStyle(color: colorBright);
  static const TextStyle textStyleUsual2 = TextStyle(color: colorSmooth2);

  static BoxDecoration containerBoxDecorationUsual1 = BoxDecoration(
    shape: BoxShape.rectangle,
    border: Border.all(color: colorBright, width: 1),
  );

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
      String? Function(String?) validator,
      TextEditingController textController,
      InputDecoration decoration,
      {bool isPassword = false}) {
    return TextFormField(
      autocorrect: !isPassword,
      obscureText: isPassword,
      controller: textController,
      autofillHints: Characters("Input $inputFieldText here..."),
      validator: validator,
      decoration: decoration,
      style: textStyleUsual2,
      textAlignVertical: TextAlignVertical.center,
    );
  }

  static bool validate(String input, RegExp regularExpression) {
    return regularExpression.firstMatch(input) != null;
  }

  static String? Function(String?) getTextFormFieldValidator(
      String inputFieldText, RegExp validationExpression) {
    return (String? value) {
      if (value!.isEmpty) {
        return "Input $inputFieldText";
      }
      if (!validate(value, validationExpression)) {
        return "Invalid $inputFieldText value";
      }
      return null;
    };
  }

  static SnackBar getSnackBar(String text) {
    return SnackBar(
        content: Text(
          text,
          style: textStyleUsual1,
        ),
        backgroundColor: colorDark);
  }

  static Column getFullInputFieldAsColumn(String inputFieldText,
      String? Function(String?) validator, TextEditingController textController,
      {double marginHorizontal = 35,
      double distanceFloating = 5,
      bool isPassword = false,
      String? hintText,
      TextStyle? hintTextStyle}) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(
              vertical: distanceFloating, horizontal: marginHorizontal),
          child: Text(
            "$inputFieldText:",
            style: textStyleUsual1,
            textScaleFactor: 1.25,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: marginHorizontal, vertical: distanceFloating),
          child: Extensions.getTextFormFieldWithValidator(
              inputFieldText.toLowerCase(),
              validator,
              textController,
              InputDecoration(
                  hintText: hintText,
                  hintStyle: hintTextStyle,
                  enabledBorder: inputFieldBorder1,
                  border: inputFieldBorder1),
              isPassword: isPassword),
        ),
      ],
    );
  }
}
