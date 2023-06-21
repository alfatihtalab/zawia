import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/hero.dart';
import '../widgets/animated_hero_card.dart';
final heroTopics = <HeroTopic>[
  HeroTopic(headingTitle: "Who We Are?", topic: "We bring recognition to your brands! Whether you are running an online business or a brick-and-mortar business, Brand Advertising is the key factor that drives your business towards success. Zawia Advertising is the leading brand advertising company in Ajman servicing all over the emirates including – Dubai, Sharjah, and Abu Dhabi. Since our inception in 2014, we are specialized in carrying out all types of advertising solutions such as signboards, printing services, website design, and other marketing services to boost your brand recognition. We work with a team of experienced staff to ensure 100% success on all the projects we undertake. "),
  HeroTopic(headingTitle: "What We Can Do For You?", topic: " SOCIAL MEDIA MARKETING (SMM) Social Media marketing Social Media Marketing Services in Dubai – Ajman Zawia Publishing & Advertising (ZPA).\nMOBILE APP PROMOTION SERVICES MOBILE APP PROMOTION SERVICES Mobile App Promotion Services in Dubai – Ajman for Android & IOS The prevalence of Android"),
  HeroTopic(headingTitle: "What Makes Zawia Advertising in Dubai Stands out from the Rest?", topic: "1. A pool of experience Highly skilled in performing the job.\n2. Innovative thinking in concept creation & brand design.\n3. A clear understanding of customer demands.\n4. Expertise in designing a brand that speaks your brand message.\n5. Full range of advertising solution that maximizes your return."),
  HeroTopic(headingTitle: "headingTitle", topic: "topic"),
];
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TODO  Header
        AnimatedHeroCardList(
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
        //TODO  description
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return SizedBox();
              },

              separatorBuilder: (BuildContext context, int index) {
                return Container(

                  child: ListTile(
                    title: Text(heroTopics[index].headingTitle,
                      style: GoogleFonts.roboto(
                        fontSize: 22
                      ),),
                    subtitle:Text(heroTopics[index].topic, style: GoogleFonts.roboto(
                        fontSize: 18
                    ),)
                    ,
                  ),
                );
              },

              itemCount: heroTopics.length,

            ),
          ),
        )
      ],
    );
  }
}
