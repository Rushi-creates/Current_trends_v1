part of 'role_bloc.dart';

sealed class RoleState extends Equatable {
  const RoleState();

  @override
  List<Object> get props => [];
}

final class NoRoleState extends RoleState {}

final class UserRoleState extends RoleState {}
