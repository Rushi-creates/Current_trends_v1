import 'package:ct_v1/WIDGETS/common_widgets.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        minimum: EdgeInsets.only(top: 60, left: 20, right: 20),
        child: SizedBox(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Align(alignment: Alignment.centerLeft, child: BackButton()),
            //@
            MyText(
              label: 'Search users',
              // textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
              size: 22,
              color: Color.fromARGB(255, 47, 47, 78),
            ),

            //@
            SizedBox(height: 40),
            _SearchBar(),
            SizedBox(height: 40),
            SingleTile(),
            SingleTile(title: 'Kevin'),
          ]),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

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
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 60,
            offset: const Offset(2, 35),
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      child: Text(
        'Search users',
        style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: const Color.fromARGB(255, 82, 82, 82).withOpacity(0.3),
            fontStyle: FontStyle.normal),
      ),
    );
  }
}
