import 'package:get/get.dart';
import 'package:judostore/repository/api-repository.dart';
import 'package:judostore/storage/data-preferences.dart';
import 'package:judostore/ui/home/home.dart';

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
