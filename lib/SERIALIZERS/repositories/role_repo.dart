import '../../API_HELPER/api_services/shared_preferences_helper.dart';

enum RoleEnum { user, noRole }

class RoleSpRepo {
  RoleSpRepo._();
  static final instance = RoleSpRepo._();

  setRole(RoleEnum role) async {
    return await SharedPreferencesHelper.set('role', role.toString());
  }

  getRole() {
    return SharedPreferencesHelper.get('role');
  }

  removeRole() async {
    return await SharedPreferencesHelper.remove('role');
  }
}
