import 'package:ct_v1/CONSTANTS/image_paths.dart';
import 'package:ct_v1/SCREENS/search_screen.dart';

import 'package:flutter/material.dart';
import 'package:sliver_snap/widgets/sliver_snap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
/* -------------------------------------------------------------------------- */
/*                               //! Declarations                              */
/* -------------------------------------------------------------------------- */

//

/* -------------------------------------------------------------------------- */
/*                                  //! Build                                 */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   // elevation: 0.0,
      //   //leading: IconButton(
      //   //  icon: Icon(
      //   //   Icons.arrow_back,
      //   //   color: Colors.black,
      //   //   ),
      //   //   onPressed: (){
      //   //       Navigator.pop(context);
      //   //   }
      //   // ),
      //   // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      //   title: const Text(
      //     'Home', //give here appBar title
      //     style: TextStyle(color: Colors.black
      //         // fontWeight: FontWeight.bold
      //         // fontSize: 15,
      //         ),
      //   ),
      //   //actions: [

      //   //  Padding(
      //   //    padding: const EdgeInsets.all(8.0),
      //   //   child: IconButton(
      //   //       onPressed: null,
      //   //       icon: Icon(
      //   //         Icons.search,
      //   //         color: Colors.black,
      //   //       )), )
      //   // ],
      // ),

      body: MyBody(),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                //! Structure                               */
/* -------------------------------------------------------------------------- */

class MyBody extends StatelessWidget {
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverSnap(
        // elevation: 2,
        snap: false,
        collapsedBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        expandedBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        expandedContentHeight: MediaQuery.of(context).size.height * 0.24,

        /* -------------------------------------------------------------------------- */
        /*                                //@ Expnaded                                */
        /* -------------------------------------------------------------------------- */

        expandedContent: const _WelcomeCard(),
        /* -------------------------------------------------------------------------- */
        /*                                //@ Collapsed                               */
        /* -------------------------------------------------------------------------- */

        collapsedContent: const Text(
          "CURRENT TRENDS",
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 40, 0, 87),
            // decoration: TextDecoration.none,
            // fontStyle: FontStyle.italic,
            // fontFamily: "FontNameHere" ,
            fontWeight: FontWeight.bold,
            // fontWeight: FontWeight.w300,
            // fontSize: 20.0,
          ),
        ),

        /* -------------------------------------------------------------------------- */
        /*                                  //@ body                                  */
        /* -------------------------------------------------------------------------- */

        body: const Column(
          children: [
            // SizedBox(height: 10),
            TempCardDeleteLater(
                photoUrl:
                    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/pq2p8ovf8PZps2HafvJaLrZK8gS.jpg"),
            TempCardDeleteLater(
                photoUrl:
                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/rpzFxv78UvYG5yQba2soO5mMl4T.jpg')
          ],
        ));
  }
}

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,

      /// borders
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),

        // gradient
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 114, 148, 243),
            Color.fromARGB(255, 60, 42, 217),
            // Color.fromARGB(255, 91, 119, 247),
            // Color.fromARGB(255, 89, 42, 218),
          ],
        ),

        // bg curves
        image: DecorationImage(
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          image: AssetImage(ImagePaths.bgCurves),
        ),
      ),

      //
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 40,
          top: 50,
          bottom: 20,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.08,
                    backgroundColor: Colors.white,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(252, 186, 177, 207),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: MediaQuery.of(context).size.width * 0.073,
                      ),
                    ),
                  ),

                  //
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SearchScreen();
                      }));
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 40,
                      color: Colors.white,
                    ),
                  )
                ],
              ),

              //remove gesture dectector from here later
              const Text(
                'Current Trends',
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                // textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.0,
                  color: Colors.white,
                  // decoration: TextDecoration.none,
                  // fontStyle: FontStyle.italic,
                  fontFamily: "Poppins",
                  // fontWeight: FontWeight.bold,
                  fontWeight: FontWeight.w800,
                  fontSize: 26.0,
                ),
              ),
            ]),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                 //!   NOTE                                 */
/* -------------------------------------------------------------------------- */
// THIS BELOW CODE WAS AUTO-GENERATED BY FIGMA DEV

class TempCardDeleteLater extends StatelessWidget {
  final String photoUrl;
  const TempCardDeleteLater({super.key, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: SizedBox(
        width: 379,
        height: 250,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 379,
                height: 250,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(photoUrl),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 379,
                height: 250,
                decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.7099999785423279),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 22,
              top: 221,
              child: Text(
                'Series',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 190,
              top: 0,
              child: Container(
                width: 189,
                height: 250,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(photoUrl),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 22,
              top: 110,
              child: Text(
                'Flora and\nSon',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            const Positioned(
              left: 22,
              top: 186,
              child: Text(
                'Mark watched this series\non 2023',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            const Positioned(
              left: 67,
              top: 19,
              child: Text(
                'Mark',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            const Positioned(
              left: 67,
              top: 38,
              child: Text(
                'Zuckerbug',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 19,
              child: Container(
                width: 44,
                height: 44,
                decoration: const ShapeDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: OvalBorder(
                    side: BorderSide(width: 2, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
