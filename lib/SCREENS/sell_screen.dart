// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../CONSTANTS/generic_classes.dart';
import '../WIDGETS/chips_widget/ui/chip_widget.dart';
import '../WIDGETS/generic_buttons.dart';
import '../WIDGETS/image_picker/PickSingleImage_screen.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              _SellChips(),
              MyTextField(label: 'Item name'),
              MyTextField(label: 'Size'),
              MyTextField(label: 'Description'),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    flex: 1,
                    child: MyTextField(label: 'Rent Price'),
                  ),
                  Flexible(
                    flex: 1,
                    child: MyTextField(label: 'Original Price'),
                  )
                ],
              ),
              ImagePickerScreen(),
              DisplayLocation(),
              GreenButton(onTap: null, text: 'Submit'),
              SizedBox(height: 100),
            ],
          ),
        ),
      )),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class _SellChips extends StatelessWidget {
  const _SellChips();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ChipWidget<SellChips>(
            index: 0,
            nonActiveWidget: _GenericSellChipIcon(label: 'Formal'),
            activeWidget:
                _GenericSellChipIcon(label: 'Formal', isActive: true)),
        ChipWidget<SellChips>(
            index: 1,
            nonActiveWidget: _GenericSellChipIcon(label: 'Ethnic'),
            activeWidget:
                _GenericSellChipIcon(label: 'Ethnic', isActive: true)),
        ChipWidget<SellChips>(
            index: 2,
            nonActiveWidget: _GenericSellChipIcon(label: 'Wedding Dress'),
            activeWidget:
                _GenericSellChipIcon(label: 'Wedding Dress', isActive: true)),
      ],
    );
  }
}

class _GenericSellChipIcon extends StatelessWidget {
  final String label;
  // final IconData icon;
  final bool isActive;
  // final Color? color;

  const _GenericSellChipIcon({
    Key? key,
    // this.color,
    required this.label,
    // required this.icon,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Color dynamicColor = isActive
    //     ? const Color.fromARGB(255, 0, 73, 78)
    //     : const Color.fromARGB(255, 0, 73, 78);

    return FittedBox(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Chip(
            label: Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: isActive
                ? const Color.fromARGB(255, 18, 185, 169)
                : Colors.grey,
          )),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class DisplayLocation extends StatelessWidget {
  const DisplayLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
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
            padding: const EdgeInsets.all(20),
            child: Text(
              'Map here',
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: const Color.fromARGB(255, 82, 82, 82).withOpacity(0.3),
                  fontStyle: FontStyle.normal),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Your location will be shown here.  ',
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 202, 202, 202),
              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              fontSize: 14.0,
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

class MyTextField extends StatelessWidget {
  final String label;
  const MyTextField({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field required';
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: label, border: const OutlineInputBorder()),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                                //! Service                                 */
/* -------------------------------------------------------------------------- */

class _SellScreenService {
  // static BlocBuilder displayWhichScreenStates() {
  //   return BlocBuilder<ChipsCubit<SellChips>, int?>(builder: (context, state) {
  //     if (state == 0) {
  //       return const HomeScreen();
  //     } else if (state == 1) {
  //       return const ProductDetailsScreen();
  //     } else if (state == 2) {
  //       return const SellScreen();
  //     } else if (state == 3) {
  //       return const ProductDetailsScreen();
  //     } else if (state == 4) {
  //       return const ProfileScreen();
  //     }
  //     return const HomeScreen();
  //   });
  // }
}
