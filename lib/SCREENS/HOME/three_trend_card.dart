import 'package:ct_v1/SCREENS/SETTINGS/settings_screen.dart';
import 'package:ct_v1/WIDGETS/common_widgets.dart';
import 'package:flutter/material.dart';

class ThreeTrendCard extends StatelessWidget {
  const ThreeTrendCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 233, 233, 233), width: 2),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          // gradient: LinearGradient(colors: [Colors.pink, Colors.deepPurple]),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 60,
              offset: const Offset(2, 35),
            ),
          ],
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        child: const Column(
          children: [
            _PostCardProfileDetails(),
            SizedBox(height: 20),
            Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              direction: Axis.horizontal,
              children: [
                Flexible(
                  flex: 1,
                  child: _TrendImageAndName(
                      url: 'https://picsum.photos/seed/songs/800/600'),
                ),
                Flexible(
                  flex: 1,
                  child: _TrendImageAndName(
                      isCenter: true,
                      url:
                          'https://www.movieposters.com/cdn/shop/products/108b520c55e3c9760f77a06110d6a73b_240x360_crop_center.progressive.jpg?v=1573652543'),
                ),
                Flexible(
                  flex: 1,
                  child: _TrendImageAndName(
                      url: 'https://picsum.photos/seed/movies/800/600'),
                ),
              ],
            ),
          ],
        ));
  }
}

class _PostCardProfileDetails extends StatelessWidget {
  const _PostCardProfileDetails();

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          flex: 1,
          child: DisplayProfileWidget(
            radiusScale: 0.06,
            ringColor: SettingsService.primaryColor.withOpacity(0.8),
            gradient1: const Color.fromARGB(255, 252, 232, 255),
            gradient2: const Color.fromARGB(84, 252, 246, 255),
          ),
        ),
        const SizedBox(width: 8),
        const Flexible(
          flex: 1,
          child: _UserDetailsText(),
        )
      ],
    );
  }
}

class _UserDetailsText extends StatelessWidget {
  const _UserDetailsText();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rushi Creates',
          style: TextStyle(
            color: SettingsService.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 13,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          'rushi.creates@gmail.com',
          style: TextStyle(
            color: SettingsService.primaryColor,
            fontSize: 10,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class _TrendImageAndName extends StatelessWidget {
  final bool isCenter;
  final String url;

  const _TrendImageAndName({
    this.isCenter = false,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: isCenter == true
                ? MediaQuery.of(context).size.width * 0.1
                : MediaQuery.of(context).size.width * 0.08,
            backgroundImage: NetworkImage(url),
          ),
          const SizedBox(height: 20),
          Text(
            'Flora and Son',
            style: TextStyle(
              color: SettingsService.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 10,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            'This was a crazy movie',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: SettingsService.primaryColor,
              fontSize: 8,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
