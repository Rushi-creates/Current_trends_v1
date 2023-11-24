import 'package:ct_v1/SCREENS/HOME/one_trend_card.dart';

import '../../SCREENS/PROFILE/profile_collapsed_sliver.dart';
import '../../SCREENS/PROFILE/profile_expanded_sliver.dart';
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
                OneTrendCard(),
                OneTrendCard(),
              ],
            )));
  }
}
