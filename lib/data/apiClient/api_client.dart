import 'dart:convert';

import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/use_model/user_model.dart';
import 'package:iynfluencer/presentation/complete_profile_creator_screen/models/complete_profile_creator_model.dart';
import 'package:iynfluencer/presentation/complete_profile_influencer_screen/models/complete_profile_influencer_model.dart';
import 'package:iynfluencer/presentation/creator_profile_draweritem/models/creator_profile_model.dart';
import 'package:iynfluencer/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:get/get.dart';

import '../../presentation/log_in_screen/models/log_in_model.dart';
import '../models/Influencer/influencer_response_model.dart';

class ApiClient extends GetConnect {
  // Configure the base URL
  ApiClient() {
    httpClient.baseUrl = 'https://bv9pfcsd5b.execute-api.us-east-1.amazonaws.com/api/v1/';
  }

  //Post request for signup
  Future<Response> signUp(SignUpModel user) async {
    Response response;
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
      throw Exception('Server error');
    }
  }
  // post request for login
  Future<Response> logIn(LogInModel user) async {
    Response response;
    try {
       response = await post(
          'users/auth/login',
          user.toJson(),
          headers: {"Content-Type": "application/json"}
      );
      if(response.isOk){
        return response;
      } else {
        print(response);
        print(response.body);
        print(response.statusCode);
        print(user.toJson());
        print('Server error: ${response.statusText}');
        return response;
        throw Exception('Server error');
      }
    } catch (e) {
      print(e);
      throw Exception('Server error');
    }
  }

  //Get request for user using token
  Future<UserModel> getUser(String token) async {
    String tokenS = token.toString();
    print(token);
    Response response;
    try {
      response = await get(
        'users/me',
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      if (response.isOk) {
        // Decode the response body
        Map<String, dynamic> responseBody = response.body;
        // Access the 'data' field and pass it to the UserModel.fromJson method
        return UserModel.fromJson(responseBody['data']);
      } else {
        print(response);
        print(response.body);
        throw Exception('Server error');
      }
    } catch (e) {
      print('$e from user');
      throw Exception('Server error');
    }
  }

  //post request for creating a creator profile
  Future<Response> creatorProfile(CompleteProfileCreatorModel profile, var token) async {
    Response response;
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
        print('its good');
        return response;

      } else {
        print(response);
        print(response.body);
        print(response.statusCode);
        print(profile.toJson());
        print('Server error: ${response.statusText}');
        return response;
        throw Exception('Server error');
      }
    } catch (e) {
      print(e);
      throw Exception('Server error');
    }
  }

//post request for creating a influencer profile
  Future<Response> influencerProfile(CompleteProfileInfluencerModel profile, var token) async {
    Response response;
    try {
      response = await post(
          '/influencers/me',
          profile.toJson(),
          headers: {
            "Content-Type": "application/json",
            'Authorization':token,
          }
      );
      if(response.isOk){
        return response;
      } else {
        print(response);
        print(response.body);
        print(response.statusCode);
        print(profile.toJson());
        print('Server error: ${response.statusText}');
        return response;
        throw Exception('Server error');
      }
    } catch (e) {
      print(e);
      throw Exception('Server error');
    }
  }

  // Get Request to get a list of Influencers
  Future <List<Influencer>> getInfluencers(int pageNumber, int limit) async {
    Response response;
    try {
      response = await get(
          'influencers?page=${pageNumber.toString()}',
          headers: {
            "Content-Type": "application/json",
          }
      );
      if(response.isOk){
        final responseJson = response.body;
        final influencerResponse = InfluencerResponse.fromJson(responseJson);
        final influencers = influencerResponse.data.docs; // List of Influencers
        return influencers;
      } else {
        print(response);
        print(response.body);
        throw Exception('Server error');
      }
    } catch (e) {
      print('$e from getting list of influencers');
      print(e);
      throw Exception('Server error');
    }
  }

}



