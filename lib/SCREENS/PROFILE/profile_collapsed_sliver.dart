import '../../SCREENS/SETTINGS/settings_screen.dart';
import 'package:flutter/material.dart';

class ProfileCollapsedSliver extends StatelessWidget {
  const ProfileCollapsedSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
/* -------------------------------------------------------------------------- */
/*                              //@ declarations                              */
/* -------------------------------------------------------------------------- */

    String noPfp =
        'https://icon-library.com/images/no-image-icon/no-image-icon-25.jpg';

/* -------------------------------------------------------------------------- */
/*                                  //@ build                                 */
/* -------------------------------------------------------------------------- */

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 231, 231, 231),
            )),
/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */
        Row(
          children: [
            const SizedBox(width: 8),
/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */
            CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.04,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(noPfp)
                // radius: 35.0,
                ),

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                'Seller Name',
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                // textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 71, 71, 71),
                  // decoration: TextDecoration.none,
                  // fontStyle: FontStyle.italic,
                  // fontFamily: "FontNameHere" ,
                  // fontWeight: FontWeight.bold,
                  // fontWeight: FontWeight.w300,
                  fontSize: 13.0,
                ),
              ),
            ),
          ],
        ),

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

        const Spacer(),

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */
        IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SettingsScreen();
              }));
            },
            icon: const Icon(
              Icons.more_vert,
              color: Color.fromARGB(255, 107, 107, 107),
            ))
      ],
    );
  }
}
