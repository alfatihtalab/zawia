import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../ui/webview_page.dart';
import '../utilties/ui_utilties/animations/shimmer_loading_effect.dart';

class SectionCard extends StatelessWidget {
  const SectionCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.urlPage,
      required this.imageUrl})
      : super(key: key);

  final String title;
  final String subtitle;
  final String urlPage;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewPage(
                      urlPage: urlPage,
                      title: title,
                    )));
      },
      child: Card(
        child: SizedBox(
          // width: 500,
          // height: 100,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  // height: 150,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => SizedBox(
                      child: Shimmer(
                          gradient: isDarkMode
                              ? shimmerGradientDark
                              : shimmerGradientLight,
                          child: const ImageLoadingPlaceholder(
                            isLoading: true,
                            height: 250,
                            // width: 500,
                          )),
                    ),
                    errorWidget: (context, url, error) =>
                        const ImageLoadingPlaceholder(
                      isLoading: true,
                    ),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(title),
                subtitle: Text(subtitle),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OfficeCard extends StatelessWidget {
  const OfficeCard(
      {Key? key,
      required this.imageUrl,
      required this.placeName,
      required this.address})
      : super(key: key);
  final String imageUrl;
  final String placeName;
  final String address;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Card(
      child: SizedBox(
        // width: 500,
        // height: 100,
        child: Column(
          children: [
            Expanded(
              child: Container(
                // height: 150,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => SizedBox(
                    child: Shimmer(
                        gradient: isDarkMode
                            ? shimmerGradientDark
                            : shimmerGradientLight,
                        child: const ImageLoadingPlaceholder(
                          isLoading: true,
                          height: 250,
                          // width: 500,
                        )),
                  ),
                  errorWidget: (context, url, error) =>
                  const ImageLoadingPlaceholder(
                    isLoading: true,
                  ),
                  imageBuilder: (context, imageProvider) => Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(placeName),
              subtitle: Text(address),
            )
          ],
        ),
      ),
    );
  }
}
