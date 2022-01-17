import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:crud1/auth/security.dart';

class Service {
  Dio dio = new Dio();

  sendPost(name, type, purpose, price, discription, lat, long) async {
    var userId = await Lokee().readSecurity();
    var payload = {
      "name": name,
      "type": type,
      "purpose": purpose,
      " description": discription,
      "price": price,
      "guides": await userId,
      "longitude": long,
      "latitiude": lat
    };

    try {
      Response<Map> pol = await dio.post(
          'https://damp-eyrie-16388.herokuapp.com/api/furniture/create',
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

  Future<http.StreamedResponse> sendImage(name, path) async {
    /* String uri =
        'https://damp-eyrie-16388.herokuapp.com/api/furniture/upload/$name';
    var u = Uri.parse(uri);
    var request = http.MultipartRequest('Patch', Uri.parse(uri));
    request.files.add(await http.MultipartFile.fromPath("images", path));
    request.headers.addAll({"Content-Type": "multipart/form-data"});
    var responce = request.send();
 */
    try {
      FormData formData = new FormData.fromMap(
          {'file': await MultipartFile.fromFile(path, filename: name)});
      Response<Map> respp = await dio.patch(
          'https://damp-eyrie-16388.herokuapp.com/api/furniture/upload/$name',
          options: Options(
            headers: {"Content-Type": "multipart/form-data", "accept": "*/*"},
            followRedirects: false,
            validateStatus: (status) => true,
          ),
          data: formData);
    } on DioError catch (e) {
      print(e);
    }
  }

  Future sendLocation() async {
    try {
      Response<Map> respose =
          await dio.get('https://api.ipregistry.co/?key=dfp1pvybudjgz1nu');
      return respose;
    } catch (e) {}
  }

  /*  Future writeLocation(lon, lat, name) async {
    try {
      String longitude = "longitude";
      String latitiude = "latitude";
      var payload = {
        "location": [
          {
            "coordinates": lon,
          },
          {"coordinates": lat}
        ]
      };
      var response = await dio.put(
          'https://damp-eyrie-16388.herokuapp.com/api/furniture/update/location/$name',
          options: Options(
            contentType: 'application/json',

            followRedirects: false,
            // will not throw errors
            validateStatus: (status) => true,
          ),
          data: payload);
      return response;
    } catch (e) {
      print(e);
    }
  }*/
}
