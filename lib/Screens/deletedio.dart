import 'package:dio/dio.dart';
import 'package:crud1/auth/security.dart';

class toService {
  Dio dio = new Dio();
  sendPost(dname) async {
    try {
      var payload = {"name": dname};
      var id = await Lokee().readSecurity();

      Response<Map> resp = await dio.delete(
          'https://damp-eyrie-16388.herokuapp.com/api/furniture/delete/$id',
          options: Options(
            contentType: 'application/json',
            followRedirects: false,
            // will not throw errors
            validateStatus: (status) => true,
          ),
          data: payload);
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
