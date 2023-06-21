import 'package:flutter/material.dart';

import '../widgets/cards.dart';

final sectionCards = <Widget >[
  const SectionCard(
    title: 'Social Media & Websites',
    subtitle: 'Zawia',
    urlPage: 'https://zawia.ae/projects/social-media-websites/',
    imageUrl:
    'https://i0.wp.com/zawia.ae/wp-content/uploads/2022/09/social-media-website.png?resize=768%2C579&ssl=1',
  ),const SectionCard(
    title: 'Branding & Design',
    subtitle: 'Zawia',
    urlPage: 'https://zawia.ae/projects/branding-design/',
    imageUrl:
    'https://i0.wp.com/zawia.ae/wp-content/uploads/2022/09/design.png?resize=768%2C579&ssl=1',
  ),const SectionCard(
    title: 'Printing Services',
    subtitle: 'Zawia',
    urlPage: 'https://zawia.ae/projects/gift-items-uniform/',
    imageUrl:
    'https://i0.wp.com/zawia.ae/wp-content/uploads/2022/09/social-media-website.png?resize=768%2C579&ssl=1',
  ),const SectionCard(
    title: 'Gift Items & Uniform',
    subtitle: 'Zawia',
    urlPage: 'https://zawia.ae/projects/gift-items-uniform/',
    imageUrl:
    'https://i0.wp.com/zawia.ae/wp-content/uploads/2022/09/gift.png?resize=768%2C579&ssl=1',
  ),const SectionCard(
    title: 'Signboards',
    subtitle: 'Zawia',
    urlPage: 'https://zawia.ae/projects/signboards/',
    imageUrl:
    'https://i0.wp.com/zawia.ae/wp-content/uploads/2022/09/signboard-1.png?resize=768%2C579&ssl=1',
  ),const SectionCard(
    title: 'Event Management',
    subtitle: 'Zawia',
    urlPage: 'https://zawia.ae/projects/event-management/',
    imageUrl:
    'https://i0.wp.com/zawia.ae/wp-content/uploads/2022/09/event-management.png?resize=768%2C579&ssl=1',
  ),
];


class SectionGridViewWidget extends StatelessWidget {
  const SectionGridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: sectionCards.length,
      itemBuilder: (context, i) =>  sectionCards[i],
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 1),
    );
  }
}
