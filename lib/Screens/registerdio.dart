import 'package:dio/dio.dart';

class AuthService {
  Dio dio = new Dio();
  sendPost(name, email, password) async {
    var payload = {
      "name": name,
      "email": email,
      "password": password,
      "role": "seller"
    };
    print(payload);
    try {
      var pol = await dio.post(
          'https://damp-eyrie-16388.herokuapp.com/api/user/create',
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
