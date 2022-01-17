import 'package:dio/dio.dart';

class AuthService {
  Dio dio = new Dio();
  sendPost(email, password) async {
    var payload = {"email": email, "password": password};

    try {
      Response<Map> pol = await dio.post(
          'https://damp-eyrie-16388.herokuapp.com/api/user/login',
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
