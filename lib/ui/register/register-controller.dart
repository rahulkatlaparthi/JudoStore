import 'package:get/get.dart';
import 'package:judostore/repository/api-repository.dart';
import 'package:judostore/storage/data-preferences.dart';
import 'package:judostore/ui/home/home.dart';

class RegisterController extends GetxController {
  final apiRepository = Get.find<ApiRepository>();
  final dataPreference = Get.find<DataPreferences>();
  final isSellerEnabled = false.obs;

  toggleSeller() {
    isSellerEnabled.toggle();
  }

  Future<void> registerUser(Map<String, dynamic> body) async {
    int userID = await apiRepository.apiRegisterUser(body = body);
    if (userID != -1) {
      dataPreference.savePreference(dataPreference.kUserKey, userID);
      Get.offAll(() => HomeScreen());
    }
  }
}
