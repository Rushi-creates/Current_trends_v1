import 'package:ct_v1/SCREENS/search_screen.dart';

import '../SCREENS/product_details_screen.dart';
import '../SCREENS/sell_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../SCREENS/home_screen.dart';
import '../SCREENS/PROFILE/profile_screen.dart';
import '../WIDGETS/chips_widget/cubit/chips_cubit.dart';
import '../CONSTANTS/generic_classes.dart';
import '../WIDGETS/chips_widget/ui/chip_widget.dart';

class BottombarWidget extends StatelessWidget {
  const BottombarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: BottomBarBody(),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class BottomBarBody extends StatelessWidget {
  const BottomBarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _BottomBarWidgetService.displayWhichScreenStates(),

          // box
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
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
            child: const _BottomBarButtons(),
          ),

          //

          // const
          const Align(
            alignment: Alignment.bottomCenter,
            child: ChipWidget<GBottomBar>(
              index: 2,
              activeWidget: CircularSellButton(text: 'Sell'),
              nonActiveWidget: CircularSellButton(text: 'Sell'),
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
class CircularSellButton extends StatelessWidget {
  // final VoidCallback? onTap;
  final String text;
  final double?
      size; // Use a single property for size instead of height and width
  const CircularSellButton({
    Key? key,
    // required this.onTap,
    required this.text,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
      child: Container(
        height: size ?? 70,
        width: size ?? 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle, // Make it a circle
          border: Border.all(
            color: const Color.fromARGB(255, 0, 17, 92),
            width: 2,
          ),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 62, 0, 207),
              Color.fromARGB(255, 158, 105, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              // Text(
              //   text,
              //   style: const TextStyle(
              //     color: Colors.white,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 12.0,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                   //@                                      */
/* -------------------------------------------------------------------------- */

class _BottomBarButtons extends StatelessWidget {
  const _BottomBarButtons();

  @override
  Widget build(BuildContext context) {
    return const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
//
          ChipWidget<GBottomBar>(
              index: 0,
              activeWidget: _GenericBottombarIcon(
                icon: Icons.home_filled,
                isActive: true,
              ),
              nonActiveWidget:
                  _GenericBottombarIcon(icon: Icons.home_outlined)),

//

          ChipWidget<GBottomBar>(
              index: 1,
              activeWidget: _GenericBottombarIcon(
                icon: Icons.search,
                isActive: true,
              ),
              nonActiveWidget:
                  _GenericBottombarIcon(icon: Icons.search_outlined)),
//

          SizedBox(width: 20),
          // ChipWidget<GBottomBar>(
          //     index: 2,
          //     activeWidget: _SellBottomBarIcon(
          //       icon: Icons.add,
          //       isActive: true,
          //     ),
          //     nonActiveWidget:
          //         _SellBottomBarIcon(icon: Icons.favorite_outline)),

//
          ChipWidget<GBottomBar>(
              index: 3,
              activeWidget: _GenericBottombarIcon(
                icon: Icons.favorite,
                isActive: true,
              ),
              nonActiveWidget:
                  _GenericBottombarIcon(icon: Icons.favorite_outline)),

          //
          ChipWidget<GBottomBar>(
              index: 4,
              activeWidget: _GenericBottombarIcon(
                icon: Icons.person,
                isActive: true,
              ),
              nonActiveWidget:
                  _GenericBottombarIcon(icon: Icons.person_outline)),
        ]);
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class _GenericBottombarIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  // final Color? color;

  const _GenericBottombarIcon({
    Key? key,
    this.isActive = false,
    // this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color dynamicColor = isActive
        ? const Color.fromARGB(255, 17, 0, 78)
        : const Color.fromARGB(255, 27, 0, 78);

    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [dynamicColor, dynamicColor.withOpacity(0.8)],
              end: Alignment.topRight,
              begin: Alignment.bottomLeft,
            ).createShader(bounds);
          },
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// class _SellBottomBarIcon extends StatelessWidget {
//   final IconData icon;
//   final bool isActive;
//   // final Color? color;

//   const _SellBottomBarIcon({
//     Key? key,
//     // this.color,
//     required this.icon,
//     required this.isActive,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Color dynamicColor =
//     //     isActive ? const Color.fromARGB(255, 0, 73, 78) : Colors.grey;

//     return Column(
//       children: [
//         Padding(
//             padding: const EdgeInsets.all(2.0),
//             child: CircleAvatar(
//               backgroundColor: const Color.fromARGB(255, 2, 0, 100),
//               radius: MediaQuery.of(context).size.width * 0.06,
//               child: CircleAvatar(
//                 backgroundColor: const Color.fromARGB(255, 60, 2, 218),
//                 radius: MediaQuery.of(context).size.width * 0.053,
//                 child: const Icon(Icons.add, color: Colors.white),
//               ),
//             )),
//       ],
//     );
//   }
// }

/* -------------------------------------------------------------------------- */
/*                                //! Service                                 */
/* -------------------------------------------------------------------------- */

class _BottomBarWidgetService {
  static BlocBuilder displayWhichScreenStates() {
    return BlocBuilder<ChipsCubit<GBottomBar>, int?>(builder: (context, state) {
      if (state == 0) {
        return const HomeScreen();
      } else if (state == 1) {
        return const SearchScreen();
      } else if (state == 2) {
        return const SellScreen();
      } else if (state == 3) {
        return const ProductDetailsScreen();
      } else if (state == 4) {
        return const ProfileScreen();
      }
      return const HomeScreen();
    });
  }
}
