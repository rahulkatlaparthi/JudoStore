import 'package:get/get.dart';
import 'package:judostore/repository/api-repository.dart';
import 'package:judostore/storage/data-preferences.dart';

class AddBookController extends GetxController{
  final apiRepository = Get.find<ApiRepository>();
  int? attachmentId;

  Future<void> addBook(Map<String,dynamic> body) async {
    final data = await apiRepository.apiAddBook(body);
    if(data > -1){
      Get.back();
    }
  }
}