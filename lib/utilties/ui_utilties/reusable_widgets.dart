import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';



abstract class ReusableWidgets {

  static InputDecoration buildInputDecoration(
      {required BuildContext context ,required IconData icon, required String hintText}) {
    return InputDecoration(
      prefixIcon: Icon(icon),
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.bodyMedium,

      // fillColor: Colors.purple.shade50,
      // filled: true,
      // enabled: false,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(
          // color: Colors.yellow,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(
          // color: Colors.yellow,
          width: 1.5,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          // color: Colors.deepOrangeAccent,
          width: 1.5,
        ),
      ),
      border: const OutlineInputBorder(
          borderSide: BorderSide(
            // color: Colors.deepOrangeAccent,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
    );
  }

  static showLoaderDialog({required BuildContext context, required String title, }) {
    // final appLocal = AppLocalizations.of(context)!;
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Row(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(width: 10,),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("please wait...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  showAlertDialogWithTitleContent(BuildContext context){
    // final appLocal = AppLocalizations.of(context)!;
    AlertDialog alert = AlertDialog(
      title: Text("Title"),
      content: Column(
        children: [
          // const CircularProgressIndicator(),
          // SizedBox(width: 10,),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("please wait...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  static void showSnackBar({required BuildContext context,
    required String snackMessage,required Color color}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        action: SnackBarAction(
          label: "OK",
          textColor: Colors.white,
          onPressed: () {},
        ),
        content: Text(
          snackMessage,
          style: const TextStyle(fontSize: 14),
        )));
  }


}