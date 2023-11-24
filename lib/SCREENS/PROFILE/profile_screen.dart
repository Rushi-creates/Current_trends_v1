import '../../SCREENS/PROFILE/profile_collapsed_sliver.dart';
import '../../SCREENS/PROFILE/profile_expanded_sliver.dart';
import '../../SCREENS/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:sliver_snap/widgets/sliver_snap.dart';

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SliverSnap(
            snap: false,
            collapsedBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
            expandedBackgroundColor: Colors.transparent,
            expandedContentHeight: MediaQuery.of(context).size.height * 0.33,

            //
            expandedContent: const ProfileExpandedSliverCard(),
            collapsedContent: const ProfileCollapsedSliver(),
            body: const Column(
              children: [
                SizedBox(height: 50),
                TempCardDeleteLater(
                    photoUrl:
                        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/pq2p8ovf8PZps2HafvJaLrZK8gS.jpg"),
                TempCardDeleteLater(
                    photoUrl:
                        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/rpzFxv78UvYG5yQba2soO5mMl4T.jpg')
              ],
            )));
  }
}
