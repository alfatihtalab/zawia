import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zawia/models/hero.dart';

import '../utilties/ui_utilties/animations/shimmer_loading_effect.dart';
import 'cards.dart';

class AnimatedHeroCardList extends StatefulWidget {
  const AnimatedHeroCardList({Key? key, required this.heros})
      : super(key: key);
  final List<HeroCard> heros;

  @override
  State<AnimatedHeroCardList> createState() => _AnimatedHeroCardListState();
}

class _AnimatedHeroCardListState extends State<AnimatedHeroCardList> {
  late ScrollController _controller;

  // List<Widget> offers = [const OfferCard(), const OfferCard()];

  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = MediaQuery.of(context).size;
    var deviceOrientation = MediaQuery.of(context).orientation;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return SizedBox(
      // height: 0,
      child: CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              aspectRatio: screenSize.height / screenSize.width,
              // height:
                  // deviceOrientation == Orientation.portrait ? 400 : 100,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration:
                  const Duration(milliseconds: 5000),
              autoPlayCurve: Curves.decelerate,
              enlargeCenterPage: true,
              disableCenter: true),
          items: widget.heros
              .map((e) => Card(
            elevation: 8,
                child: Container(
                      height: 60,
                      width: screenSize.width,
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          color: isDarkMode? e.color.withAlpha(130): e.color.withAlpha(250),
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Center(
                        child: Text(
                          e.title,
                          style: GoogleFonts.lato(
                              fontSize: 24,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
              ))
              .toList()),
    );
  }
}


class SlideCard extends StatelessWidget {
  // final ExploreRecipe recipe;
  final String imageUrl;

  const SlideCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;


    return Center(
      child: Container(
        // padding: const EdgeInsets.all(4),
        constraints: BoxConstraints.expand(
          width: screenSize.width,
          height: 250,
        ),
        decoration: const BoxDecoration(

          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),

        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => SizedBox(
            child: Shimmer(
                gradient: isDarkMode? shimmerGradientDark: shimmerGradientLight,
                child:  const ImageLoadingPlaceholder(
                  isLoading: true,
                  height: 250,
                  // width: 500,
                )),
          ),
          errorWidget: (context, url, error) => const ImageLoadingPlaceholder(
            isLoading: true,
          ),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
                // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)


              ),
            ),
          ),

        ),
      ),
    );
  }
}
