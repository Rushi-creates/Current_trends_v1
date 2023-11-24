import '../WIDGETS/image_picker/image_picker_logic/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../SCREENS/LOGIN/login_button_logic/login_button_bloc.dart';
import '../SCREENS/REGISTER/register_button_logic/register_button_bloc.dart';
import '../SCREENS/SETTINGS/UserLod_logic/user_lod_bloc.dart';
import '../WIDGETS/role_checker/role_logic/role_bloc.dart';
import '../CONSTANTS/generic_classes.dart';
import '../WIDGETS/chips_widget/cubit/chips_cubit.dart';
// import '../CONSTANTS/generic_classes.dart';

class MyBlocProviders {
  static getProviders(BuildContext context) {
    return [
      BlocProvider(create: (context) => ChipsCubit<GBottomBar>(0)),
      BlocProvider(create: (context) => ChipsCubit<SellChips>(0)),
      BlocProvider(create: (context) => RoleBloc()),
      BlocProvider(create: (context) => RegisterButtonBloc()),
      BlocProvider(create: (context) => LoginButtonBloc()),
      BlocProvider(create: (context) => UserLodBloc()),
      BlocProvider(create: (context) => ImagePickerBloc()),
    ];
  }
}
