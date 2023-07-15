import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect {
  // Configure the base URL
  ApiClient() {
    httpClient.baseUrl = 'https://4rttr0gxlf.execute-api.us-east-1.amazonaws.com/api/v1/';
  }

  //Post request for signup
  Future<Response> signUp(SignUpModel user) async {
    try {
      var response = await post(
          'users/auth/signup',
          user.toJson(),
          headers: {"Content-Type": "application/json"}
      );
      if(response.isOk){
        return response;
      } else {
        print(response.body);
        print(response.statusCode);
        print(user.toJson());
        print('Server error: ${response.statusText}');
        throw Exception('Server error');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
