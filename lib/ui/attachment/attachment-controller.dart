import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:judostore/repository/api-repository.dart';
import 'package:judostore/utils/ui-helper.dart';

class AttachmentController extends GetxController {
  final apiRepository = Get.find<ApiRepository>();
  var imageUrl = Rx<XFile?>(null);

  updateImage(XFile url) {
    imageUrl.value = url;
  }

  saveAttachment() async {
    if (imageUrl.value == null) {
      showAlertDialog(message: 'File Not Found');
      return;
    }
    int value = await apiRepository.apiAttachFile(
        imageUrl.value!.path, "");
    if (value > -1) {
      Get.back(result: value);
    }
  }
}
