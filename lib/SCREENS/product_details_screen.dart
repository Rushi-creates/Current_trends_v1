import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../WIDGETS/generic_buttons.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          _ProductDetailsStructureWidget(),
          _SellButton(),
        ],
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class _ProductDetailsStructureWidget extends StatelessWidget {
  const _ProductDetailsStructureWidget();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            MyCarousel(),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [_ProductText(), _HeartIcon()],
                  ),
                  SizedBox(height: 20),

                  //
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Flexible(
                        flex: 1,
                        child: _ClothSize(),
                      ),
                      SizedBox(width: 4),
                      Flexible(
                        flex: 2,
                        child: _OtherDetails(),
                      )
                    ],
                  ),

                  //
                  SizedBox(height: 4),
                  _DescriptionBox(),
                  SizedBox(height: 4),
                  _SellerCard(),
                ],
              ),
            ),
            SizedBox(height: 100),
          ]),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class MyCarousel extends StatelessWidget {
  const MyCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    List imageList = [
      "https://picsum.photos/id/1015/600/900",
      "https://picsum.photos/id/1020/600/900",
      "https://picsum.photos/id/1035/600/900",
      "https://picsum.photos/id/1040/600/900",
      "https://picsum.photos/id/1050/600/900",
    ];

    return CarouselSlider.builder(
      carouselController: carouselController,
      itemCount: imageList.length,
      options: CarouselOptions(
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        scrollDirection: Axis.horizontal,
        aspectRatio: 16 / 9,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 7),
        autoPlayAnimationDuration: const Duration(seconds: 2),

        //this Carouseld.builder's height is important,
        //if single tile's height exceeds this height, then we get a overflow error
        height: MediaQuery.of(context).size.height * 0.38,
      ),
      itemBuilder: (BuildContext context, i, int pageViewIndex) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: NetworkImage(imageList[i]),
              fit: BoxFit.cover,
            ),
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
          margin: const EdgeInsets.all(4),
          // padding: const EdgeInsets.all(20),
        );
      },
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class _ProductText extends StatelessWidget {
  const _ProductText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Product Name",
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        // decoration: TextDecoration.none,
        // fontStyle: FontStyle.italic,
        // fontFamily: "FontNameHere" ,
        fontWeight: FontWeight.bold,
        // fontWeight: FontWeight.w300,
        fontSize: 28.0,
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class _HeartIcon extends StatelessWidget {
  const _HeartIcon();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      size: 28,
      Icons.favorite_outline,
      color: Colors.pink,
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class _ClothSize extends StatelessWidget {
  const _ClothSize();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 233, 233, 233), width: 2),
          borderRadius: BorderRadius.circular(12),
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
        // margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 45,
          child: FittedBox(
            child: Column(
              children: [
                const Icon(
                  Icons.tag,
                  size: 25,
                  color: Color.fromARGB(255, 199, 199, 199),
                ),
                Text(
                  'Size M',
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: const Color.fromARGB(255, 82, 82, 82)
                          .withOpacity(0.3),
                      fontStyle: FontStyle.normal),
                ),
              ],
            ),
          ),
        ));
  }
}

class _OtherDetails extends StatelessWidget {
  const _OtherDetails();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 233, 233, 233), width: 2),
          borderRadius: BorderRadius.circular(12),
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
        // margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Type: Formal',
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color:
                        const Color.fromARGB(255, 82, 82, 82).withOpacity(0.3),
                    fontStyle: FontStyle.normal),
              ),
              Text(
                'Original Price:  Rs 700',
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color:
                        const Color.fromARGB(255, 82, 82, 82).withOpacity(0.3),
                    fontStyle: FontStyle.normal),
              ),
            ],
          ),
        ));
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class _DescriptionBox extends StatelessWidget {
  const _DescriptionBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(255, 233, 233, 233), width: 2),
        borderRadius: BorderRadius.circular(12),
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
      // margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DESCRIPTION',
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: const Color.fromARGB(255, 82, 82, 82).withOpacity(0.3),
                fontStyle: FontStyle.normal),
          ),
          const SizedBox(height: 8),
          const Text(
            'A short description about the product. this \ncan be maximum of 5 lines.',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: "Poppins",
                // fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color.fromARGB(255, 163, 163, 163),
                fontStyle: FontStyle.normal),
          ),
        ],
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class _SellerCard extends StatelessWidget {
  const _SellerCard();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 233, 233, 233), width: 2),
          borderRadius: BorderRadius.circular(12),
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
        // margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Flex(
              mainAxisSize: MainAxisSize.max,
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 50.0,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: 'https://i.pravatar.cc/400',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      const Text(
                        "Seller Name",
                        // maxLines: 2,
                        // overflow: TextOverflow.ellipsis,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          // decoration: TextDecoration.none,
                          // fontStyle: FontStyle.italic,
                          // fontFamily: "FontNameHere" ,
                          fontWeight: FontWeight.bold,
                          // fontWeight: FontWeight.w300,
                          fontSize: 20.0,
                        ),
                      ),
                      const Text(
                        "Posted on 23/11/23  |  \nLocation : VIRAR WEST, MUMABI.",
                        // maxLines: 2,
                        // overflow: TextOverflow.ellipsis,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          // decoration: TextDecoration.none,
                          // fontStyle: FontStyle.italic,
                          // fontFamily: "FontNameHere" ,
                          // fontWeight: FontWeight.bold,
                          // fontWeight: FontWeight.w300,
                          fontSize: 10.0,
                        ),
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Flexible(
                            flex: 1,
                            child: GreenButton(
                              onTap: null,
                              text: 'Chat',
                              height: 35,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: GreenButton(
                              onTap: null,
                              text: 'Visit Profile',
                              height: 35,
                              width: MediaQuery.of(context).size.width,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // const MyMapWidget()
          ],
        ));
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class _SellButton extends StatelessWidget {
  const _SellButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
            colors: [Colors.white, Colors.white],
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          // Flexible(
          //   flex: 1,
          //   child: GreenButton(
          //     onTap: null,
          //     text: 'Add to cart',
          //     height: 45,
          //     width: MediaQuery.of(context).size.width,
          //   ),
          // ),
          Flexible(
            flex: 2,
            child: GreenButton(
              onTap: null,
              text: 'Rent now:  Rs 300',
              height: 45,
              width: MediaQuery.of(context).size.width,
            ),
          )
        ],
      ),
    );
  }
}
