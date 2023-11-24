import 'package:flutter/material.dart';
// import 'package:another_flushbar/flushbar.dart';

class DisplayProfileWidget extends StatelessWidget {
  final double radiusScale;
  final Color ringColor;
  final Color gradient1;
  final Color gradient2;

  const DisplayProfileWidget({
    super.key,
    this.ringColor = Colors.white,
    this.radiusScale = 0.08,
    this.gradient1 = Colors.white,
    this.gradient2 = const Color.fromARGB(136, 87, 90, 255),
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.width * radiusScale,
      backgroundColor: ringColor,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              gradient1,
              gradient2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: MediaQuery.of(context).size.width * (radiusScale - 0.007),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class MyText extends StatelessWidget {
  final String label;
  final Color color;
  final double size;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  const MyText(
      {super.key,
      this.label = 'Loren ipsum',
      this.size = 15.0,
      this.color = Colors.deepPurple,
      this.textAlign = TextAlign.left,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        // decoration: TextDecoration.none,
        // fontStyle: FontStyle.italic,
        fontFamily: "Poppins",
        fontWeight: fontWeight,
        fontSize: size,
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class MyBox extends StatelessWidget {
  const MyBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [Colors.green, Colors.yellow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      child: Text('This is a container with all of its properties used.'),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class SingleTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const SingleTile({
    Key? key,
    this.icon = Icons.person,
    this.title = 'Rushi',
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Color.fromARGB(255, 241, 241, 241),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),

          // color: Colors.white,
          child: ListTile(
            onTap: onTap,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 1,
            ),
            tileColor: Colors.white,
            leading: Container(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: const Color.fromARGB(255, 106, 116, 250),
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                color: Color.fromRGBO(106, 116, 250, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
            // subtitle: const Text(
            //   'List Tile Subtitle',
            //   style: TextStyle(
            //     color: Colors.black,
            //   ),
            // ),
            trailing: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.arrow_forward_ios,
                // color: Color.fromARGB(255, 199, 165, 255),
                color: Color.fromARGB(255, 106, 116, 250),
              ),
            ),
          ),
        ));
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class PleaseWaitLoaderWidget extends StatelessWidget {
  const PleaseWaitLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(
            'please wait..',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
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

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Some Error Try again',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

// class MyFlushBar {
//   static Future topFlushbar(context) async {
//     await Flushbar(
//       flushbarPosition: FlushbarPosition.TOP,
//       backgroundColor: Colors.green,
//       title: 'Post created',
//       message: 'Post added to your profile',
//       duration: const Duration(seconds: 3),
//     ).show(context);
//   }
// }

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

SnackBarWidget(
  BuildContext ctx,
  String text, {
  Color bgColor = Colors.black,
}) {
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: bgColor,
      content: Text(text),
    ),
  );
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class GenericDialogs {
  static dialog(
    BuildContext context, {
    String heading = "Warning!",
    String description = "Are you sure?",
    List<Widget>? actions,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: const EdgeInsets.all(14.0),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 13, 0, 88),
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(description),
                  ),
                ],
              ),
              actions: actions);
        });
  }
}
