part of 'role_bloc.dart';

sealed class RoleEvent extends Equatable {
  const RoleEvent();

  @override
  List<Object> get props => [];
}

class CheckRoleEvent extends RoleEvent {}

class SetRoleEvent extends RoleEvent {
  final RoleEnum role;
  const SetRoleEvent({required this.role});
}

class RemoveRoleEvent extends RoleEvent {}
