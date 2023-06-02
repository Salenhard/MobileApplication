import 'package:flutter/material.dart';
import 'package:untitled4/Other/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Extensions.colorDark,
      body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.35,
              vertical: MediaQuery.of(context).size.width * 0.65),
          child: ElevatedButton(
            onPressed: () async {
              var uri = Uri(path: 'calculator://');
              if (await canLaunchUrl(uri)) {
                try {
                  await launchUrl(uri);
                } catch (e) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                      Extensions.getSnackBar(
                          "Can't launch canculator\nError: $e)"));
                }
              } else {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                    Extensions.getSnackBar(
                        "Can't launch canculator (Used URL: $uri)"));
              }
            },
            child: const FittedBox(
              alignment: Alignment.center,
              child: Text(
                "Launch system calculator",
                style: Extensions.textStyleMainField1,
              ),
            ),
          )),
    );
  }
}
