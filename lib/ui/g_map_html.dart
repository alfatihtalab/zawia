import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zawia/ui/webview_page.dart';

class GoogleMapLocationFrame extends StatefulWidget {
  const GoogleMapLocationFrame({Key? key}) : super(key: key);

  @override
  State<GoogleMapLocationFrame> createState() => _GoogleMapLocationFrameState();
}

class _GoogleMapLocationFrameState extends State<GoogleMapLocationFrame> {

  late final WebViewController controller;
  var loadingPercentage = 0;
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(25.3993169, 55.4462629),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(25.3993169,55.4462629 ),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse("https://www.google.com/maps/place/Zawia+Publishing+%26+Advertising/@25.3993169,55.4462629,14.71z/data=!4m6!3m5!1s0x3e5f582d6d60f9e7:0xbd667d0bd9ce6269!8m2!3d25.398913!4d55.4472342!16s%2Fg%2F11c2qj___x?hl=en-US"),
      );
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: {
              Marker(markerId: MarkerId("Zawia"), position: LatLng(25.3993169,55.4462629))
            },
          )
        ],
      )
    );
  }
}
