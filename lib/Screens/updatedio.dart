import 'package:dio/dio.dart';
import 'package:crud1/auth/security.dart';

class Service {
  Dio dio = new Dio();
  sendPost(objname, price) async {
    var payload = {"name": objname, "price": price};
    var name = await Lokee().readSecurity();
    try {
      Response<Map> pol = await dio.put(
          'https://damp-eyrie-16388.herokuapp.com/api/furniture/update/$name',
          options: Options(
            contentType: 'application/json',
            followRedirects: false,
            // will not throw errors
            validateStatus: (status) => true,
          ),
          data: payload);
      return pol;
    } on DioError catch (e) {
      print(e);
      /* Fluttertoast.showToast(
          msg: e.response.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.black,
          fontSize: 16); */
    }
  }
}
