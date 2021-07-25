import 'package:get/get.dart';
import 'package:july_18_flutter/models/product.dart';
import 'package:july_18_flutter/repository/api-repository.dart';
import 'package:july_18_flutter/storage/data-preferences.dart';
import 'package:july_18_flutter/utils/ui-helper.dart';

class HomeController extends GetxController {
  final apiRepository = Get.find<ApiRepository>();
  final dataPreference = Get.find<DataPreferences>();

  final userList = <Product>[].obs;

  void fetchUsers() async {
    userList.value = await apiRepository.apiGetProducts(
        {"userid": dataPreference.readPreference(dataPreference.kUserKey)});
    if(userList.isEmpty){
      showAlertDialog(message: 'No items found.');
    }
  }
}
