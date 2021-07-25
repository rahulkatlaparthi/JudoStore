import 'package:get/get.dart';
import 'package:july_18_flutter/repository/api-repository.dart';
import 'package:july_18_flutter/storage/data-preferences.dart';
import 'package:july_18_flutter/ui/home/home.dart';

class LoginController extends GetxController {
  final apiRepository = Get.find<ApiRepository>();
  final dataPreference = Get.find<DataPreferences>();

  Future<void> verifyLogin(Map<String, dynamic> body) async {
    int userId = await apiRepository.apiCheckLogin(body);
    if (userId != -1) {
      dataPreference.savePreference(dataPreference.kUserKey, userId);
      Get.off(() => HomeScreen());
    }
  }
}
