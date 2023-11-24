/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

import 'package:ct_v1/SCREENS/followers_screen.dart';

import '../../SCREENS/SETTINGS/settings_screen.dart';
import '../../SCREENS/edit_profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileExpandedSliverCard extends StatelessWidget {
  const ProfileExpandedSliverCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        //1
        const _ProfileCardBg(),

        //2
        const Padding(
          padding: EdgeInsets.only(left: 30.0, top: 10, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ProfileBackButton(), ProfileSettingsButton()],
          ),
        ),

        //3
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.09),
            const ProfileImage(),
            const ProfileCardUsernameAndBio(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EditProfileButton(),
                SizedBox(width: 8),
                _FollowersListButton(),
              ],
            )
          ],
        )
      ],
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    String noPfp =
        'https://icon-library.com/images/no-image-icon/no-image-icon-25.jpg';
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: CircleAvatar(
        backgroundColor: const Color.fromARGB(146, 127, 252, 194),
        radius: MediaQuery.of(context).size.width * 0.14,
        child: CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.13,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(noPfp),
          // radius: 35.0,
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class _ProfileCardBg extends StatelessWidget {
  const _ProfileCardBg();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // bg color + image
        Container(
          height: MediaQuery.of(context).size.height * 0.23,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 150, 255, 206),
                Color.fromARGB(255, 42, 211, 217),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            // image: DecorationImage(
            //   alignment: Alignment.topCenter,
            //   fit: BoxFit.cover,
            //   image: AssetImage('images/profile_card_bg.png'),
            // ),
          ),
        ),

        // white box
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.16,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                  color: Color.fromARGB(255, 250, 250, 250),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class ProfileCardUsernameAndBio extends StatelessWidget {
  const ProfileCardUsernameAndBio({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            // '@' +
            'Seller Name',
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff2E394A),
              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              fontSize: 18.0,
            ),
          ),

          //
          SizedBox(height: 2),

          Text(
            'Lorem Ipsum',
            // 'Hello, i made 3 sales this week, loving this platform.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 46, 74, 72),
              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              // fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              fontSize: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const EditProfileScreen();
          }));
        },
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 85, 85),
                  Color.fromARGB(255, 0, 143, 153),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit,
                    size: 14,
                    color: Colors.white,
                  ),
                  Text(
                    '  Edit Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// /* -------------------------------------------------------------------------- */
// /*                            //@  Back button                                */
// /* -------------------------------------------------------------------------- */

class ProfileBackButton extends StatelessWidget {
  const ProfileBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pop(context);
      },
      child: SafeArea(
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: const Color.fromARGB(54, 255, 255, 255),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.keyboard_backspace_sharp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// /* -------------------------------------------------------------------------- */
// /*                             //@ Setting button                             */
// /* -------------------------------------------------------------------------- */

class ProfileSettingsButton extends StatelessWidget {
  const ProfileSettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: const Color.fromARGB(54, 255, 255, 255),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const SettingsScreen();
            }));
          },
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                   //@                                      */
/* -------------------------------------------------------------------------- */
class _FollowersListButton extends StatelessWidget {
  const _FollowersListButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FollowersScreen(appbarTitle: 'Followers');
          }));
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 0, 109, 76)),
              color: Colors.white,
              // color: Color(0xFF6DFAFF),
              borderRadius: const BorderRadius.all(Radius.circular(6))),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people,
                    size: 14,
                    color: Color.fromARGB(255, 0, 190, 175),

                    // color: Color(0xff56A8E9),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
