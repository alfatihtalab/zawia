import 'package:flutter/material.dart';

import '../widgets/cards.dart';
final serviceCards = <Widget >[
  const SectionCard(
    title: 'Search Engine Optimization',
    subtitle: 'Zawia',
    urlPage: 'https://zawia.ae/services/search-engine-optimization/',
    imageUrl:
    'https://i0.wp.com/zawia.ae/wp-content/uploads/2022/09/social-media-website.png?resize=768%2C579&ssl=1',
  ),const SectionCard(
    title: 'SMO Services Company in Dubai - Ajman',
    subtitle: 'Zawia',
    urlPage: 'https://zawia.ae/services/social-media-marketing/',
    imageUrl:
    'https://i0.wp.com/zawia.ae/wp-content/uploads/2022/09/design.png?resize=768%2C579&ssl=1',
  ),const SectionCard(
    title: 'PAY PER CLICK (PPC MANAGEMENT)',
    subtitle: 'Zawia',
    urlPage: 'https://zawia.ae/services/pay-per-click-ppc-management/',
    imageUrl:
    'https://i0.wp.com/zawia.ae/wp-content/uploads/2022/09/social-media-website.png?resize=768%2C579&ssl=1',
  ),const SectionCard(
    title: 'ONLINE REPUTATION MANAGEMENT(ORM)',
    subtitle: 'Zawia',
    urlPage: 'https://zawia.ae/services/online-reputation-managementorm/',
    imageUrl:
    'https://i0.wp.com/zawia.ae/wp-content/uploads/2022/09/gift.png?resize=768%2C579&ssl=1',
  ),const SectionCard(
    title: 'MOBILE APP PROMOTION SERVICES',
    subtitle: 'Zawia',
    urlPage: 'https://zawia.ae/services/mobile-app-promotion-services/',
    imageUrl:
    'https://i0.wp.com/zawia.ae/wp-content/uploads/2022/09/signboard-1.png?resize=768%2C579&ssl=1',
  ),
];

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: serviceCards.length,
      itemBuilder: (context, i) =>  serviceCards[i],
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 1),
    );
  }
}
