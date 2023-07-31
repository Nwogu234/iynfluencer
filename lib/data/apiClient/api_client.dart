import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/use_model/user_model.dart';
import 'package:iynfluencer/presentation/complete_profile_creator_screen/models/complete_profile_creator_model.dart';
import 'package:iynfluencer/presentation/creator_profile_draweritem/models/creator_profile_model.dart';
import 'package:iynfluencer/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:get/get.dart';

import '../../presentation/log_in_screen/models/log_in_model.dart';

class ApiClient extends GetConnect {
  // Configure the base URL
  ApiClient() {
    httpClient.baseUrl = 'https://4rttr0gxlf.execute-api.us-east-1.amazonaws.com/api/v1/';
  }

  //Post request for signup
  Future<Response> signUp(SignUpModel user) async {
    var response;
    try {
       response = await post(
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
      return response;
    }
  }
  // post request for login
  Future<Response> logIn(LogInModel user) async {
    var response;
    try {
       response = await post(
          'users/auth/login',
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
        return response;
        throw Exception('Server error');
      }
    } catch (e) {
      print(e);
      return response;
    }
  }

  //Get request for user using token
  Future<UserModel> getUser(String token) async {
    // httpClient.addRequestModifier<void>((request) {
    //   request.headers['Authorization'] = '$token';
    //   return request;
    // });
   String  tokenS =token.toString();
    print(token);
    var response;
    try {
      response = await get(
          'users/me',
          headers: {
            "Content-Type": "application/json",
            'Authorization':token,
          }
      );
      if(response.isOk){
        return UserModel.fromJson((response.body as Map<String, dynamic>)['data']);
      } else {
        print(response);
        print(response.body);
        throw Exception('Server error');
      }
    } catch (e) {
      print(e);
      throw Exception('Server mrror');
    }
  }
  //post request for creating a creator profile
  Future<Response> creatorProfile(CompleteProfileCreatorModel profile, var token) async {
    var response;
    try {
      response = await post(
          'creators/me',
          profile.toJson(),
          headers: {
            "Content-Type": "application/json",
            'Authorization':token,
          }
      );
      if(response.isOk){
        return response;
      } else {
        print(response.body);
        print(response.statusCode);
        print(profile.toJson());
        print('Server error: ${response.statusText}');
        return response;
        throw Exception('Server error');
      }
    } catch (e) {
      print(e);
      return response;
    }
  }
}
