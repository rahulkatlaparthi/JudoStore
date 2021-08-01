import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DataPreferences extends GetxController {
  final String kUserKey = "userID";
  final String kIpAddressKey = "ipAddress";

  savePreference(String key, dynamic value) {
    GetStorage().write(key, value);
  }

  T? readPreference<T>(String key) {
    return GetStorage().read<T?>(key);
  }

  deletePreferences() {
    GetStorage().erase();
  }

  bool checkUserAlreadyExisted() {
    return readPreference(kUserKey) != null;
  }
}
