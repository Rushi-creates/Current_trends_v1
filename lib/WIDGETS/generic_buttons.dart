// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  const GenericButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.pinkAccent,
            Colors.deepOrangeAccent,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GreenButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final double? height;
  final double? width;
  const GreenButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => debugPrint('button pressed'),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height ?? MediaQuery.of(context).size.height * 0.07,
          width: width ?? MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 0, 71, 71),
                Color.fromARGB(255, 0, 43, 71),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WhiteButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final double? height;
  final double? width;
  const WhiteButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => debugPrint('button pressed'),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height ?? MediaQuery.of(context).size.height * 0.07,
          width: width ?? MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.black, width: 2),
              gradient: const LinearGradient(colors: [
                Colors.white,
                Colors.white,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                // color: Colors.white,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WhiteButton2 extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final double? height;
  final double? width;
  const WhiteButton2(
      {Key? key,
      required this.onTap,
      required this.text,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => debugPrint('button pressed'),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height ?? MediaQuery.of(context).size.height * 0.07,
          width: width ?? MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                  color: const Color.fromARGB(255, 206, 206, 206), width: 2),
              gradient: const LinearGradient(colors: [
                Colors.white,
                Colors.white,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                // color: Colors.white,
                color: Color.fromARGB(255, 95, 95, 95),
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BlackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final double? height;
  final double? width;
  const BlackButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => debugPrint('button pressed'),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height ?? MediaQuery.of(context).size.height * 0.07,
          width: width ?? MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border:
                  Border.all(color: Color.fromARGB(255, 17, 17, 17), width: 2),
              gradient: const LinearGradient(colors: [
                Colors.black,
                Colors.black,
                // Color.fromARGB(255, 92, 92, 92),
                // Color.fromARGB(255, 92, 92, 92),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                // color: Colors.white,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GreenButton3 extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final double? height;
  final double? width;
  const GreenButton3(
      {Key? key,
      required this.onTap,
      required this.text,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => debugPrint('button pressed'),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height ?? MediaQuery.of(context).size.height * 0.07,
          width: width ?? MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border:
                  Border.all(color: Color.fromARGB(255, 0, 92, 54), width: 2),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 0, 207, 121),
                Color.fromARGB(255, 0, 207, 121),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                // color: Colors.white,
                color: Color.fromARGB(255, 0, 92, 54),
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
