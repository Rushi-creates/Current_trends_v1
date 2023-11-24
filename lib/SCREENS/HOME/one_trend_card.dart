// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ct_v1/WIDGETS/common_widgets.dart';

class OneTrendCard extends StatelessWidget {
  final String url;
  const OneTrendCard({
    Key? key,
    this.url =
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/pq2p8ovf8PZps2HafvJaLrZK8gS.jpg",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height * 0.3;

//
    return Container(
      width: double.infinity,
      height: cardHeight,
      margin: const EdgeInsets.all(10),
      // padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            url,
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.srcOver,
          ),
        ),
        border: Border.all(
          color: const Color.fromARGB(255, 233, 233, 233),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        // gradient: LinearGradient(colors: [Colors.pink, Colors.deepPurple]),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 60,
            offset: const Offset(2, 35),
          ),
        ],
      ),

      //
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Flexible(
            flex: 1,

            //
            child: Padding(
              padding:
                  EdgeInsets.only(top: 15.0, bottom: 15, left: 15, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _PostCardProfileDetailsForSingleTrendCard(),
                  Spacer(),
                  MyText(
                    label: 'Flora and Son',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    size: 25,
                  ),
                  MyText(
                    label: 'Rushi watched this series on 2023',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    size: 10,
                  ),
                  MyText(
                    label: 'Series',
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    size: 10,
                  )
                ],
              ),
            ),
          ),

          //
          Flexible(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                url,
                // width: 300,
                // height: cardHeight,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class _PostCardProfileDetailsForSingleTrendCard extends StatelessWidget {
  const _PostCardProfileDetailsForSingleTrendCard();

  @override
  Widget build(BuildContext context) {
    return const Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          flex: 1,
          child: DisplayProfileWidget(
            radiusScale: 0.06,
            // ringColor: Colors.,
            gradient1: Color.fromARGB(255, 252, 232, 255),
            gradient2: Color.fromARGB(83, 211, 211, 211),
          ),
        ),
        SizedBox(width: 8),
        Flexible(
          flex: 1,
          child: _UserDetailsTextForSingleTrendCard(),
        )
      ],
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class _UserDetailsTextForSingleTrendCard extends StatelessWidget {
  const _UserDetailsTextForSingleTrendCard();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rushi',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          'Always curious',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
