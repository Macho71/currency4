import 'package:dio/dio.dart';

class StatusService {
 

  static getHome() async {
    try {
      Response response =
          await Dio().get("https://jsonplaceholder.typicode.com/posts");
      if (response.statusCode == 200) {
        print(response.realUri);
        return (response.data as List).toList();
      } else {
        return response.statusCode.toString();
      }
    } on DioError catch (e) {
      return e.hashCode.toString();
    }
  }
}
