import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zawia/ui/section_gridview_widget.dart';

import '../config/themes/palette.dart';
import '../models/hero.dart';
import '../widgets/animated_hero_card.dart';
import '../widgets/buttons.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context)!;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
          ),
          child: SizedBox(),
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [const HeroHeaderWidget()],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              Material(
                // color: Colors.white,
                child: TabBar(
                  labelColor: isDarkMode ? primaryColorDark : Colors.lightGreen,

                  // unselectedLabelColor: Colors.grey[400],
                  indicatorWeight: 1,
                  indicatorColor: primaryColorDark,
                  tabs: const [
                    Tab(
                      icon: Icon(
                        Icons.select_all,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.business_center,
                        // color: Colors.black,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.design_services,
                        // color: Colors.black,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.explicit_outlined,
                        // color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    AboutZawiaWidget(),
                    BusinessUpWidget(),
                    SectionsWidget(),
                    ExpertWithUsWidget()
                    // Gallery(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(child: Text("Speak with our experts"),onPressed: (){},),
    );
  }
}

// Widget profileHeaderWidget(BuildContext context, ) {
//
//
//
// }

class HeroHeaderWidget extends StatefulWidget {
  const HeroHeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeroHeaderWidget> createState() => _HeroHeaderWidgetState();
}

class _HeroHeaderWidgetState extends State<HeroHeaderWidget> {
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';
  String waUrl = "";

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  String getWaUrl(String phone, String message) {
    if (Platform.isAndroid) {
      // add the [https]
      return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
    } else {
      // add the [https]
      return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Check for phone call support.
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
    waUrl = getWaUrl("widget.provider.mobileNo", "Hell ");
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context)!;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return SizedBox(
      width: double.infinity,
      // decoration: BoxDecoration(color: Colors.white),
      child: AnimatedHeroCardList(
        heros: [
          HeroCard(
              title:
                  "Zawia Advertising – The Full Service Brand Advertising Company!",
              color: Color(0xffc0e9f8)),
          HeroCard(
              title:
                  "Grow Your Business Better and Bigger with Brand Advertising ",
              color: Color(0xffffdc60)),
        ],
      ),
    );
  }
}

//about widget

class AboutZawiaWidget extends StatelessWidget {
  const AboutZawiaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          // bottom: 10,
          child: Container(
            height: 400,
            decoration: BoxDecoration(
                color: primaryColorLight.withOpacity(0.1),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(200))),
          ),
        ),
        Positioned(
          // bottom: 10,
          child: Container(
            height: 600,
            decoration: BoxDecoration(
                color: primaryColorDark.withOpacity(0.1),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(200))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              //  Title
              Text(
                "Zawia Advertising – The Full Service Brand Advertising Company! ",
                style:
                    GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.w400),
              ),
              //  about descriptin
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "We bring recognition to your brands! Whether you are running an online business or a brick-and-mortar business, Brand Advertising is the key factor that drives your business towards success. Zawia Advertising is the leading brand advertising company in Ajman servicing all over the emirates including – Dubai, Sharjah, and Abu Dhabi. Since our inception in 2014, we are specialized in carrying out all types of advertising solutions such as signboards, printing services, website design, and other marketing services to boost your brand recognition. We work with a team of experienced staff to ensure 100% success on all the projects we undertake.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),

              //  image
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ), // Image border
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(100), // Image radius
                        child: Image.asset("assets/images/z_1.jpg",
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    WideButton(text: "Talk with our experts", onPressed: () {})
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BusinessUpWidget extends StatelessWidget {
  const BusinessUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          // bottom: 10,
          child: Container(
            height: 400,
            decoration: BoxDecoration(
                color: Color(0xffd97d89).withOpacity(0.1),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(200))),
          ),
        ),
        Positioned(
          // bottom: 10,
          child: Container(
            height: 600,
            decoration: BoxDecoration(
                color: Color(0xfff495a1).withOpacity(0.1),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(200))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              //  Title
              Text(
                "Grow Your Business Better and Bigger with Brand Advertising ",
                style:
                    GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              //  about descriptin
              const SizedBox(
                height: 5,
              ),

              //  image
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Card(
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "SOCIAL MEDIA MARKETING (SMM)",
                                style: GoogleFonts.lato(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Social Media marketing Social Media Marketing Services in Dubai – Ajman Zawia Publishing & Advertising (ZPA)",
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.lato(
                                      fontSize: 16, fontWeight: FontWeight.w400),
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "learn more",
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        color: primaryColorDark,
                                        fontWeight: FontWeight.w300),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "MOBILE APP PROMOTION SERVICES",
                                style: GoogleFonts.lato(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "MOBILE APP PROMOTION SERVICES Mobile App Promotion Services in Dubai – Ajman for Android & IOS The prevalence of Android",
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
                                  style: GoogleFonts.lato(
                                      fontSize: 16, fontWeight: FontWeight.w400),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "learn more",
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        color: primaryColorDark,
                                        fontWeight: FontWeight.w300),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ONLINE REPUTATION MANAGEMENT(ORM)",
                                style: GoogleFonts.lato(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Online Reputation Management (ORM) ORM Services Company in Dubai – Ajman Zawia Publishing & Advertising (ZPA) manages the",
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
                                  style: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "learn more",
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        color: primaryColorDark,
                                        fontWeight: FontWeight.w300),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SectionsWidget extends StatelessWidget {
  const SectionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          // bottom: 10,
          child: Container(
            height: 400,
            decoration: BoxDecoration(
                color: Color(0xff5b4fff).withOpacity(0.1),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(200))),
          ),
        ),
        Positioned(
          // bottom: 10,
          child: Container(
            height: 600,
            decoration: BoxDecoration(
                color: Color(0xff7290f3).withOpacity(0.1),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(200))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              //  Title
              Text(
                "Our Sections",
                style:
                    GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.w400),
              ),
              //  about descriptin
              const SizedBox(
                height: 5,
              ),

              //  image
              SectionGridViewWidget(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ExpertWithUsWidget extends StatelessWidget {
  const ExpertWithUsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          // bottom: 10,
          child: Container(
            height: 400,
            decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.1),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(200))),
          ),
        ),
        Positioned(
          // bottom: 10,
          child: Container(
            height: 600,
            decoration: BoxDecoration(
                color: Colors.tealAccent.withOpacity(0.1),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(200))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              //  Title
              Text(
                "Expert Brand Designing Services in Dubai",
                style:
                    GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.w400),
              ),
              //  about descriptin
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "With over 10 million people in the UAE, it’s difficult for business owners to get their message in front of their customers. Here comes the importance of advertising and branding. We are one of the leading advertising agencies in Ajman and have business wings in all other Emirates including Sharjah, Abu Dhabi, and Dubai. We understand your business carefully and then start designing for your brand image – this is where we stand different from other competitors. Get in touch with us to get the right advertising services that can turn passersby into your customers.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.lato(
                      // fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
              ),

              //  image
              const SizedBox(
                height: 10.0,
              ),
              WideButton(text: "Book a consultation with Us", onPressed: () {})
            ],
          ),
        ),
      ],
    );
  }
}
