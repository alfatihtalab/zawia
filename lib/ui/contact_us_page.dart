import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zawia/ui/webview_page.dart';

import '../widgets/cards.dart';
import 'g_map_html.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
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
    waUrl =
        getWaUrl("+971501710718", "Hello there");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 1.5;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          //  TODO offices
          //  TODO contact info
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Contact info:',style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w400),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children:  [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: ()async{
                        String email = Uri.encodeComponent("pm@zawia.ae");
                        String subject = Uri.encodeComponent("Say Hi!");
                        String body = Uri.encodeComponent("Hi!\n\n Please tell us how can we help you?");
                        // print(subject); //output: Hello%20Flutter
                        Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
                        await launchUrl(mail).then((value){
                          // showCustomSnackBar(context: context, snackMessage: 'try again', type: SnackBarType.tryAgain);
                        }).onError((error, stackTrace){
                          // showCustomSnackBar(context: context, snackMessage: 'try again', type: SnackBarType.tryAgain);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error please try again")));
                        });

                      },
                      leading: const Icon(Icons.email,), title: Text("pm@zawia.ae",style: GoogleFonts.lato()),),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> WebViewPage(urlPage: "https://www.zawia.ae", title: "Zawia")));
                      },
                      leading: const Icon(Icons.public), title: Text("www.zawia.ae",style: GoogleFonts.lato()),),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: _hasCallSupport
                          ? () => setState(() {
                        _launched = _makePhoneCall(
                            "+971 50 171 0718");
                      })
                          : null,
                      leading: const Icon(Icons.phone,), title: Text("+971 50 171 0718",style: GoogleFonts.lato(),),),
                    // Row(
                    //   children: [
                    //     Icon(Icons.email,),
                    //     SizedBox(width: 5,),
                    //     Text("pm@zawia.ae", style: GoogleFonts.lato(
                    //       fontSize: 16
                    //     ),)
                    //   ],
                    // ),
                    // const SizedBox(height: 5,),
                    // Row(
                    //   children: [
                    //     Icon(Icons.public),
                    //     SizedBox(width: 5,),
                    //     Text("www.zawia.ae", style: GoogleFonts.lato(
                    //         fontSize: 16
                    //     ),)
                    //   ],
                    // ),
                    //
                    // const SizedBox(height: 5,),
                    // Row(
                    //   children: [
                    //     Icon(Icons.phone),
                    //     SizedBox(width: 5,),
                    //     Text("+971XXXXXXX", style: GoogleFonts.lato(
                    //         fontSize: 16
                    //     ),)
                    //   ],
                    // ),

                  ],
                ),
              )


            ],
          ),
          //  TODO location
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Offices:',style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w400),),
              const SizedBox(height: 5,),

              GridView.count(
                // childAspectRatio: itemHeight / itemWidth,
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                primary: false,
                crossAxisCount: 2,
                children: const [
                  //  OfficeCard
                  OfficeCard(
                    imageUrl:
                    'https://images.vexels.com/media/users/3/4494/raw/291d7a035d78b61a60d28f53a3e882ae-vector-dubai-illustration.jpg',
                    placeName: 'Dubai',
                    address: ' Location - Area',
                  ),
                  OfficeCard(
                    imageUrl:
                    'https://images.vexels.com/media/users/3/4494/raw/291d7a035d78b61a60d28f53a3e882ae-vector-dubai-illustration.jpg',
                    placeName: 'Ajman',
                    address: ' Al Rashidiya 2 - Ajman',
                  )
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Location:',style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w400),),
              const SizedBox(height: 10,),
              GoogleMapLocationFrame()

            ],
          ),


        ],
      ),
    );
  }

  Widget infoItem(Icon icon, String title, String data){
    return Row();
  }
}
