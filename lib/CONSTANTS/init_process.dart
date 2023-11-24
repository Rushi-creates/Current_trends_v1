import '../API_HELPER/api_services/shared_preferences_helper.dart';

class InitialProcess {
  static getProcess() async {
    await SharedPreferencesHelper.init();
  }
}
