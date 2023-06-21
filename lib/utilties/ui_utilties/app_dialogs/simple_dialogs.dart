import 'package:flutter/material.dart';


Future<void> showOptionsDialog({required BuildContext context,
  required String title, required List<dynamic> data}) async {
  switch (await showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(title),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () { Navigator.pop(context, data.first); },
              child: const Text('Treasury department'),
            ),
            SimpleDialogOption(
              onPressed: () { Navigator.pop(context, data.last); },
              child: const Text('State department'),
            ),
          ],
        );
      }
  )) {
    case "data.first":
    // Let's go.
    // ...
      break;
    case "data.first":
    // ...
      break;
    case null:
    // dialog dismissed
      break;
  }
}



class SimpleDialogItem extends StatelessWidget {
  const SimpleDialogItem({Key? key,
    required this.icon, required this.color, required this.text, required this.onPressed})
      : super(key: key);

  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 36.0, color: color),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}



// SimpleDialogOption(
// onPressed: () { Navigator.pop(context, Department.treasury); },
// child: const Text('Treasury department'),
// )