import 'package:ct_v1/CONSTANTS/image_paths.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../SCREENS/REGISTER/register_button_logic/register_button_bloc.dart';
import '../../SERIALIZERS/repositories/role_repo.dart';
import '../../WIDGETS/common_widgets.dart';
import '../../WIDGETS/role_checker/role_checker_widget.dart';
import '../../WIDGETS/role_checker/role_logic/role_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

        //

        body: Stack(
      children: [
        _AuthBg(),

        //

        Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            Flexible(
              flex: 1,
              child: _HomePeopleImage(),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    _WelcomeText(),
                    _WelcomeSubText(),
                    Spacer(),
                    _RegisterButtonStates(),
                    // SizedBox(height: 15),
                    _TermsConditionText(),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

// class _RegisterButton extends StatelessWidget {
//   const _RegisterButton();

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         BlocProvider.of<RegisterButtonBloc>(context)
//             .add(RegisterButtonPressedEvent(const {}));
//       },
//       child: Container(
//         height: 65,
//         width: 380,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(50),
//           color: Colors.white,
//         ),
//         child: const Center(
//             child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.g_mobiledata, size: 20),
//             SizedBox(width: 10),
//             Text(
//               "Register",
//               style: TextStyle(
//                   fontSize: 17.0,
//                   color: Color(0xff1A1665),
//                   fontWeight: FontWeight.w800),
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }

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
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class _HomePeopleImage extends StatelessWidget {
  const _HomePeopleImage();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagePaths.peopleCards,
      width: double.infinity,
    );
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome\nto Trendz',
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
        fontWeight: FontWeight.w600,
        fontSize: 55.0,
      ),
    );
  }
}

class _WelcomeSubText extends StatelessWidget {
  const _WelcomeSubText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Find what your friends are upto.\n'
      'Know their weekly content consumpution.',
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromARGB(255, 194, 185, 240),
        // decoration: TextDecoration.none,
        // fontStyle: FontStyle.italic,
        // fontFamily: "FontNameHere" ,
        fontFamily: "Poppins",
        // fontWeight: FontWeight.bold,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  const _AuthButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<RegisterButtonBloc>(context)
            .add(RegisterButtonPressedEvent(const {}));
      },
      child: Container(
        height: 65,
        width: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo

            Image.asset(
              ImagePaths.googleLogoPurple,
              height: 18,
              width: 18,
            ),

            //

            const SizedBox(width: 10),

            // text
            const Text(
              "Continue with google",
              style: TextStyle(
                  fontSize: 17.0,
                  // color: Color.fromARGB(255, 30, 8, 92),
                  color: Color.fromARGB(255, 43, 22, 101),
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}

class _TermsConditionText extends StatelessWidget {
  const _TermsConditionText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 20),
      child: Text.rich(
        TextSpan(
          children: [
            //

            const TextSpan(text: 'By continuing, you are agreeing to '),
            //

            TextSpan(
                text: 'Terms of use',
                recognizer: TapGestureRecognizer()
                  ..onTap = () async =>
                      await launchUrl(Uri.parse('https://www.google.com')),
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w600,
                )),

            //
            const TextSpan(text: ' and '),

            //
            TextSpan(
                text: 'Privacy Policy',
                recognizer: TapGestureRecognizer()
                  ..onTap = () async =>
                      await launchUrl(Uri.parse('https://www.google.com')),
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w600,
                )),
            const TextSpan(text: '.'),
          ],
        ),
        style: const TextStyle(
          color: Color.fromARGB(255, 197, 169, 250),
          fontSize: 8.0,
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //?                                    */
/* -------------------------------------------------------------------------- */

class _RegisterButtonStates extends StatelessWidget {
  const _RegisterButtonStates();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterButtonBloc, RegisterButtonState>(
      //

      listener: (context, state) {
        if (state is RegisterButtonSuccessState) {
          // //! setting role
          BlocProvider.of<RoleBloc>(context)
              .add(const SetRoleEvent(role: RoleEnum.user));

          // //
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const RoleCheckWidget();
          }));
        }
      },

      //
      builder: (context, state) {
        if (state is RegisterButtonLoadingState) {
          return const PleaseWaitLoaderWidget();
        } else if (state is RegisterButtonUnknownErrorState) {
          return _ErrorWidget(state.error);
        } else if (state is RegisterButtonAccountDontExistErrorState) {
          return _ErrorWidget(state.msg);
        }
        return const _AuthButton();
      },
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String text;
  const _ErrorWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const _AuthButton(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Error : $text',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
