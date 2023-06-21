import 'package:flutter/material.dart';

Future<void> showFullScreenDialog({required BuildContext context}) async{
  await showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog.fullscreen(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('This is a fullscreen dialog.'),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    ),
  );
}