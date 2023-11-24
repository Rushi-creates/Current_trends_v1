import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../SERIALIZERS/repositories/role_repo.dart';

part 'role_event.dart';
part 'role_state.dart';

class RoleBloc extends Bloc<RoleEvent, RoleState> {
  RoleBloc() : super(NoRoleState()) {
/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

    on<CheckRoleEvent>((event, emit) {
      String? role = RoleSpRepo.instance.getRole();

      if (role == RoleEnum.user.toString()) {
        emit(UserRoleState());
      } else if (role == RoleEnum.noRole.toString()) {
        emit(NoRoleState());
      } else if (role == null) {
        emit(NoRoleState());
      } else {
        emit(NoRoleState());
      }
    });

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

    on<SetRoleEvent>((event, emit) async {
      await RoleSpRepo.instance.setRole(event.role);
    });

    on<RemoveRoleEvent>((event, emit) async {
      await RoleSpRepo.instance.removeRole();
    });
  }
}
