import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../SCREENS/SETTINGS/UserLod_logic/user_lod_bloc.dart';
import '../../SCREENS/splash_screen.dart';
import '../../WIDGETS/common_widgets.dart';
import '../../WIDGETS/role_checker/role_logic/role_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,

      //@
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: _SettingsService.primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Settings', //give here appBar title
          style: TextStyle(
            // color: Colors.black,
            color: _SettingsService.primaryColor,

            // fontWeight: FontWeight.bold
            // fontSize: 15,
          ),
        ),
      ),

      //@

      body: const Column(
        children: [
          SizedBox(height: 10),
          ProfileCard(),
          SizedBox(height: 20),
          _LogoutTileStates(),
          _DeleteAccountTileStates()

          //
        ],
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                              //@ Profile card                              */
/* -------------------------------------------------------------------------- */

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.3,
      child: Card(
        elevation: 0.2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Row(
            children: [
              DisplayProfileWidget(
                radiusScale: 0.13,
                ringColor: _SettingsService.primaryColor.withOpacity(0.8),
                gradient1: _SettingsService.primaryColor.withOpacity(0.8),
                gradient2: _SettingsService.primaryColor.withOpacity(0.3),
              ),
              const SizedBox(width: 25),
              const _UserDetailsText()
            ],
          ),
        ),
      ),
    );
  }
}

class _UserDetailsText extends StatelessWidget {
  const _UserDetailsText();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rushi Creates',
          style: TextStyle(
            color: _SettingsService.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          'rushi.creates@gmail.com',
          style: TextStyle(
            color: _SettingsService.primaryColor,
            fontSize: 12,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                  //@ tiles                                 */
/* -------------------------------------------------------------------------- */

class _SettingsTileWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SettingsTileWidget({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        onTap: onTap,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7),
        tileColor: Colors.white,
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: _SettingsService.primaryColor,
          ),
        ),
        title: Text(
          label,
          style: TextStyle(
            color: _SettingsService.primaryColor,
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
          child: Icon(
            Icons.arrow_forward_ios,
            color: _SettingsService.primaryColor,
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //?                                    */
/* -------------------------------------------------------------------------- */

class _LogoutTileStates extends StatelessWidget {
  const _LogoutTileStates();

  @override
  Widget build(BuildContext context) {
    //

    return BlocConsumer<UserLodBloc, UserLodState>(
      listener: (context, state) {
        if (state is UserLogout_Success_State) {
          // //! remove role
          BlocProvider.of<RoleBloc>(context).add(RemoveRoleEvent());

          //
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const SplashScreen();
          }));

          //
          SnackBarWidget(context, "Signed out of app successfully",
              bgColor: Colors.green);

          //
        } else if (state is UserLogout_Failure_State) {
          Navigator.pop(context);
          SnackBarWidget(context, "Couldn't Sign out of app, try again later",
              bgColor: Colors.red);
        }
      },

      //
      builder: (context, state) {
        if (state is UserLogout_Loading_State) {
          return const Center(child: CircularProgressIndicator());
        }

        //
        return _SettingsTileWidget(
          icon: Icons.logout,
          label: 'Logout',
          onTap: () => GenericDialogs.dialog(
            context,
            description: 'Are you sure, you want to logout?',
            actions: [
              TextButton(
                child: Text(
                  "Logout",
                  style: TextStyle(color: _SettingsService.dialogTextColor),
                ),
                onPressed: () {
                  BlocProvider.of<UserLodBloc>(context)
                      .add(UserDeleteUserAccount_ButtonPressedEvent());
                },
              )
            ],
          ),
        );
      },
    );
  }
}

class _DeleteAccountTileStates extends StatelessWidget {
  const _DeleteAccountTileStates();

  @override
  Widget build(BuildContext context) {
    //

    return BlocConsumer<UserLodBloc, UserLodState>(
      listener: (context, state) {
        //

        if (state is UserDeleteUserAccount_Success_State) {
          // //! remove role
          BlocProvider.of<RoleBloc>(context).add(RemoveRoleEvent());

          Navigator.pop(context);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const SplashScreen();
          }));

          SnackBarWidget(context, "Account deleted permanantly",
              bgColor: Colors.red);

          //
        } else if (state is UserDeleteUserAccount_Failure_State) {
          Navigator.pop(context);
          Navigator.pop(context);
          SnackBarWidget(context,
              "Couldn't delete account right now, please try again later",
              bgColor: Colors.green);

          //
        } else if (state is UserDeleteUserAccount_Loading_State) {
          Navigator.pop(context);
        }
      },

      //
      builder: (context, state) {
        if (state is UserDeleteUserAccount_Loading_State) {
          return const Center(child: CircularProgressIndicator());
        }

        //
        return _SettingsTileWidget(
          icon: Icons.delete,
          label: 'Delete your account',
          onTap: () => GenericDialogs.dialog(
            context,
            description: "Are you sure you want to delete your account? "
                "This can't be undone, once deleted.",
            actions: [
              TextButton(
                child: Text(
                  "Delete permanently",
                  style: TextStyle(color: _SettingsService.dialogTextColor),
                ),
                onPressed: () {
                  BlocProvider.of<UserLodBloc>(context)
                      .add(UserDeleteUserAccount_ButtonPressedEvent());
                },
              )
            ],
          ),
        );
      },
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

class _SettingsService {
  static Color primaryColor = const Color.fromARGB(255, 106, 116, 250);
  static Color dialogTextColor = const Color.fromARGB(255, 15, 0, 71);
  // static Color primaryColor = Color.fromARGB(255, 0, 129, 90);
  // static Color dialogTextColor = Color.fromARGB(255, 0, 71, 50);
}
