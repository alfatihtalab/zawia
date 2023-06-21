import 'package:flutter/material.dart';

import '../../config/themes/palette.dart';

class WideButton extends StatelessWidget {
  const WideButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: primaryColorLight,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
        child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: isDarkMode ? Colors.black : Colors.black),
                ),
              ),
            )));
  }
}
