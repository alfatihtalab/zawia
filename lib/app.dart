import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zawia/bloc/localization_cubit/localization_cubit.dart';
import 'package:zawia/config/themes/palette.dart';
import 'package:zawia/config/themes/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zawia/ui/contact_us_page.dart';
import 'package:zawia/ui/home_page.dart';
import 'package:zawia/ui/home_page2.dart';
import 'package:zawia/ui/section_gridview_widget.dart';
import 'package:zawia/ui/services_page.dart';

import 'config/routes.dart';
import 'data/repository/language_repository.dart';

final titles = <String>["Home", "Services", "Contact Us"];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // final LanguageRepository languageRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Localizations Sample App',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
        Locale('ar'), // Arabic
      ],
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // locale: state.locale,
      routerConfig: router,
      // home: MyHomePage(title: 'Mustafeed',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController controller = PageController();
  int currentTitleIndex = 0;

  void changePageIndex(int i) {
    Navigator.pop(context);
    setState(() {
      currentTitleIndex = i;
    });
    controller.animateToPage(i,
        duration: Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      // backgroundColor: isDarkMode ? Color(0xffecf2f6):Color(0xffecf2f6) ,
      appBar: AppBar(
        // backgroundColor: !isDarkMode ? Color(0xffb8d162) : Colors.lightGreen.shade700,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(titles[currentTitleIndex]),
      ),
      drawer: Drawer(
        // backgroundColor: isDarkMode ? Color(0xffb8d162) : Colors.lightGreen.shade700,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                  // color: !isDarkMode ? Color(0xffb8d162) : Color(0xff2c3a1f)
                  ),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                      child: Image.asset("assets/logo/zawia_logo.png"),
                      backgroundColor: Colors.white.withOpacity(0.1),
                      minRadius: 0.4,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    flex: 3,
                    child: Text(
                      'Zawia Publishing & Advertising',
                      style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => changePageIndex(0),
            ),
            ListTile(
              leading: const Icon(Icons.design_services_rounded),
              title: const Text('Services'),
              onTap: () => changePageIndex(1),
            ),
            ListTile(
              leading: const Icon(Icons.call),
              title: const Text('Contact Us'),
              onTap: () => changePageIndex(2),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //  facebook
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/facebook.png",
                      height: 27,
                      width: 27,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/youtube.png",
                      height: 27,
                      width: 27,
                    ),
                  ),

                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/images/whatsapp.png",
                        height: 27,
                        width: 27,
                      ))

                  //  whatsapp
                  //  youtube
                ],
              ),
            )
          ],
        ),
      ),
      body: PageView(
        scrollDirection: Axis.vertical,

        /// [PageView.scrollDirection] defaults to [Axis.horizontal].
        /// Use [Axis.vertical] to scroll vertically.
        controller: controller,
        children: const <Widget>[HomePage2(), ServicesPage(), ContactUsPage()],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
