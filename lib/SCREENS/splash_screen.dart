import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import '../WIDGETS/role_checker/role_checker_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Color.fromARGB(255, 0, 29, 34),
    // ));
    _SplashScreenService.navToNextScreen(context);
  }

  // @override
  // void dispose() {
  //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     statusBarColor:
  //         Color.fromARGB(255, 0, 70, 75), // Set the default color here
  //   ));
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return const SplashDesign();
  }
}

class SplashDesign extends StatelessWidget {
  const SplashDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(children: [
      _AuthBg(),
      _Logo(),
    ]));
  }
}

/* -------------------------------------------------------------------------- */
/*                                 //   @                                     */
/* -------------------------------------------------------------------------- */

class _AuthBg extends StatelessWidget {
  const _AuthBg();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 11, 4, 77),
            Color.fromARGB(255, 159, 124, 255),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: LoadingAnimationWidget.dotsTriangle(
                color: Colors.white, size: 80),
          ),
          const Text(
            "Current Trends",
            // maxLines: 2,

            // overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",

              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

class _SplashScreenService {
  static void navToNextScreen(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const RoleCheckWidget();
      }));
    });
  }
}
