import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../SCREENS/LOGIN/login_button_logic/login_button_bloc.dart';
import '../../../SCREENS/REGISTER/register_screen.dart';
import '../../WIDGETS/generic_buttons.dart';
import '../../SERIALIZERS/repositories/role_repo.dart';
import '../../WIDGETS/common_widgets.dart';
import '../../WIDGETS/role_checker/role_checker_widget.dart';
import '../../WIDGETS/role_checker/role_logic/role_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const _LoginButton(),
          const _LoginButtonStates(),
          const SizedBox(height: 80),
          GenericButton(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const RegisterScreen();
                }));
              },
              text: 'Dont own an account then register here')
        ],
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<LoginButtonBloc>(context)
            .add(LoginButtonPressedEvent({}));
      },
      child: Container(
        height: 65,
        width: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: const Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.g_mobiledata, size: 20),
            SizedBox(width: 10),
            Text(
              "Login",
              style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xff1A1665),
                  fontWeight: FontWeight.w800),
            ),
          ],
        )),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //?                                    */
/* -------------------------------------------------------------------------- */

class _LoginButtonStates extends StatelessWidget {
  const _LoginButtonStates({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginButtonBloc, LoginButtonState>(
      listener: (context, state) {
        if (state is LoginButtonSuccessState) {
          // //! setting role
          BlocProvider.of<RoleBloc>(context)
              .add(const SetRoleEvent(role: RoleEnum.user));

          //
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const RoleCheckWidget();
          }));
        }
      },
      builder: (context, state) {
        if (state is LoginButtonLoadingState) {
          return const PleaseWaitLoaderWidget();
        } else if (state is LoginButtonUnknownErrorState) {
          return _ErrorWidget(state.error);
        } else if (state is LoginButtonAccountDontExistErrorState) {
          return _ErrorWidget(state.msg);
        }
        return const _LoginButton();
      },
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String text;
  const _ErrorWidget(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const _LoginButton(),
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
