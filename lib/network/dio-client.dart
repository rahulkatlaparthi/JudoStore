import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:judostore/models/actual-response.dart';
import 'package:judostore/storage/data-preferences.dart';
import 'package:judostore/utils/constants.dart';
import 'package:judostore/utils/dio-utils.dart';
import 'package:judostore/utils/ui-helper.dart';

class DioClient extends GetxController {

  final dataPreference = Get.find<DataPreferences>();

  Future<T?> makeNetworkCall<T>(
      {required String endPoint,
      required String method,
      dynamic data,
      Map<String, dynamic>? headers,
      required Function parse}) async {
    try {
      showProgressDialog();
      String path = getBaseUrl(dataPreference.readPreference(dataPreference.kIpAddressKey)) + endPoint;
      print('Url $path');
      print('Method $method');
      print('Payload $data');
      final response = await dio.Dio().fetch(dio.RequestOptions(
          path: path,
          method: method,
          headers: headers,
          data: data,
          receiveDataWhenStatusError: true,
          connectTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000));
      print("Url : ${response.realUri}");
      print("Response : $response");
      hideProgressDialog();
      if (response.data != null) {
        final data = ActualResponse<T>.fromJson(response.data, parse);
        if (data.success == true) {
          print(data.message);
          return data.returnValue;
        } else {
          handleError(message: data.message);
        }
      }
    } on dio.DioError catch (exception) {
      print(exception.message);
      handleError(message: exception.message);
    } on Exception catch (exception) {
      print(exception);
      handleError(message: exception.toString());
    }
    return null;
  }

  void handleError({String? message}) {
    hideProgressDialog();
    showAlertDialog(message: message ?? kUnknownErrorMessage);
  }
}
