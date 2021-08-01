enum Method { GET, POST, PUT, DELETE }

extension MethodType on Method {
  String getValue() {
    return this.toString().split('.').last;
  }
}

final String _kBaseUrl = "http://192.168.0.102:9091";
const kDummyEndPoint = '/dummy';
const kLoginEndPoint = '/login';
const kRegisterEndPoint = '/register';
const kAddBookEndPoint = '/addbook';
const kAttachmentEndPoint = '/attachment';
const kProductsEndPoint = '/productlist';
const kGetBooksEndPoint = '/getbooks';

String getBaseUrl(String? value){
  return (value == null || value.trim().isEmpty) == true ? _kBaseUrl : "http://"+value!;
}