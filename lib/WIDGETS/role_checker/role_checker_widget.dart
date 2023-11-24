import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../SCREENS/splash_screen.dart';
import '../../WIDGETS/role_checker/role_logic/role_bloc.dart';
import '../../SCREENS/REGISTER/register_screen.dart';
import '../bottom_bar_widget.dart';

class RoleCheckWidget extends StatefulWidget {
  const RoleCheckWidget({super.key});

  @override
  State<RoleCheckWidget> createState() => _RoleCheckWidgetState();
}

class _RoleCheckWidgetState extends State<RoleCheckWidget> {
/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RoleBloc>(context).add(CheckRoleEvent());
  }

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocListener<RoleBloc, RoleState>(
        listener: (context, state) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            if (state is NoRoleState) {
              return const RegisterScreen();
            } else if (state is UserRoleState) {
              return const BottombarWidget();
            } else {
              return const BottombarWidget();
            }
          }));
        },
        child: const SplashDesign(),
      ),
    );
  }
}
