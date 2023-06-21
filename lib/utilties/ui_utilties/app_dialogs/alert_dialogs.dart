import 'package:flutter/material.dart';


class DialogAlert extends StatelessWidget {
  const DialogAlert({super.key,
    required this.title,
    required this.description,
    required this.onPressed});
  final String title;
  final String description;
  final Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(title),
          content: Text(description),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: onPressed , //Navigator.pop(context, 'OK')
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

Future<bool> _showAlertDialogTest(BuildContext context) async {
  return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) => AlertDialog(
          icon: const CircleAvatar(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            child: Icon(Icons.check),
          ),
          title: const Text("My alert dialog"),
          content: const SizedBox(
              height: 150,
              child: Text("This is an alert dialog.\nDo you like it?")),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("No, not really!")),
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text("Yes, it's great!"))
          ])));
}