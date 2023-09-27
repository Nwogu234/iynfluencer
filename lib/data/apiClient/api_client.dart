import 'dart:convert';

import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/use_model/user_model.dart';
import 'package:iynfluencer/presentation/complete_profile_creator_screen/models/complete_profile_creator_model.dart';
import 'package:iynfluencer/presentation/complete_profile_influencer_screen/models/complete_profile_influencer_model.dart';
import 'package:iynfluencer/presentation/creator_profile_draweritem/models/creator_profile_model.dart';
import 'package:iynfluencer/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:get/get.dart';

import '../../presentation/jobs_my_bids_influencer_page/models/jobs_my_bids_influencer_model.dart';
import '../../presentation/log_in_screen/models/log_in_model.dart';
import '../models/Influencer/influencer_response_model.dart';
import '../models/Jobs/job_model.dart';

class ApiClient extends GetConnect {
  // Configure the base URL
  ApiClient() {
    httpClient.defaultContentType = "application/json";
    httpClient.baseUrl =
        'https://bv9pfcsd5b.execute-api.us-east-1.amazonaws.com/api/v1/';
  }
  dynamic errorHandler(Response response) {
    print(response.toString());
    switch (response.statusCode) {
      case 200:
        return response;

      case 201:
        return response;

      case 202:
        return response;
      case 500:
        throw "Server Error pls retry later";
      case 401:
        return Get.toNamed(
          AppRoutes.logInScreen,
        );
      case 403:
        throw 'Error occurred pls check internet and retry.';
      case 500:
      default:
        throw 'Error occurred retry';
    }
  }

  //Post request for signup
  Future<Response> signUp(SignUpModel user) async {
    Response response;
    try {
      response = await post(
        'users/auth/signup', user.toJson(),
        // headers: {"Content-Type": "application/json"}
      );
      if (response.isOk) {
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
        'users/auth/login', user.toJson(),
        // headers: {"Content-Type": "application/json"}
      );

      if (response.isOk) {
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
    Response response = Response();
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
      errorHandler(response);
      throw Exception('Server error');
    }
  }

  //post request for creating a creator profile
  Future<Response> creatorProfile(
      CompleteProfileCreatorModel profile, var token) async {
    Response response;
    try {
      response = await post('creators/me', profile.toJson(), headers: {
        "Content-Type": "application/json",
        'Authorization': token,
      });
      if (response.isOk) {
        print('its good');
        return response;
      } else {
        print('Problem ooooo');
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
  Future<Response> influencerProfile(
      CompleteProfileInfluencerModel profile, var token) async {
    Response response;
    try {
      response = await post('/influencers/me', profile.toJson(), headers: {
        "Content-Type": "application/json",
        'Authorization': token,
      });
      if (response.isOk) {
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
  Future<List<Influencer>> getInfluencers(
      int pageNumber, int limit, var token) async {
    Response response;
    try {
      response = await get(
        'influencers?page=${pageNumber.toString()}',
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      if (response.isOk) {
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

  //Get request for getting a list of all jobs
  Future<Response> getAllJobs(int pageNumber, int limit, var token) async {
    Response response;
    try {
      response = await get(
        'creators/jobs?page=$pageNumber&limit=$limit',
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      if (response.isOk) {
        return response;
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

  Future<Response> getInfluencerAllJobs(String influencerId, var token) async {
    Response response;
    try {
      response = await get(
        'creators/jobs?influencerId=$influencerId',
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      if (response.isOk) {
        return response;
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

  //List of existing jobs of an influencer
  Future<List<Job>> getInfluencerJobs(
      int pageNumber, int limit, int? budgetFrom, var token) async {
    Response response;
    try {
      response = await get(
        budgetFrom is int
            ? 'creators/jobs?budgetFrom=$budgetFrom'
            : 'creators/jobs',
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      if (response.isOk) {
        final List<dynamic> jobJsonList = response.body['data']['docs'];
        final List<Job> jobs = jobJsonList
            .map((json) => Job(
                  id: json['_id'],
                  creatorId: json['creatorId'],
                  title: json['title'],
                  description: json['description'],
                  responsibilities: List<String>.from(json['responsibilities']),
                  category: List<String>.from(json['category']),
                  budgetFrom: json['budgetFrom'],
                  budgetTo: json['budgetTo'],
                  duration: json['duration'],
                  public: json['public'],
                  hired: json['hired'],
                  suspended: json['suspended'],
                  jobId: json['jobId'],
                  createdAt: json['createdAt'],
                  updatedAt: json['updatedAt'],
                  version: json['__v'],
                  creator: Creator.fromJson(json['creator']),
                  bidsCount: json['bidsCount'],
                ))
            .toList();
        return jobs;
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

  //this is for posting a new job
  Future<Response> createJob(JobRequest jobRequest, var token) async {
    Response response;
    try {
      response = await post('creators/me/jobs', jobRequest.toJson(), headers: {
        "Content-Type": "application/json",
        'Authorization': token,
      });
      if (response.isOk) {
        return response;
      } else {
        // print(response);
        // print(response.body);
        // print(response.statusCode);
        // print(user.toJson());
        print('Server error: ${response.statusText}');
        return response;
        throw Exception('Server error');
      }
    } catch (e) {
      print(e);
      throw Exception('Server error');
    }
  }

//this is for getting list of bids
  Future<Response> getInfluencerJobsBids(var token) async {
    Response response = Response();
    try {
      response = await get(
        'influencers/me/bids',
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      if (response.isOk) {
        print('------------here oooo----');
        // print(response.body);
        return response;
      } else {
        print(response);
        // print(response.body);
        throw Exception('Server error From Jobs');
      }
    } catch (e) {
      print('$e from getting list of influencers job nids');
      errorHandler(response);
      throw Exception('Server error From influencers job  2');
    }
  }

  //this is for getting a creators list of jobs
  Future<Response> getCreatorJobs(var token) async {
    Response response;
    try {
      response = await get(
        'creators/me/jobs',
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      if (response.isOk) {
        return response;
      } else {
        print(response);
        print(response.body);
        throw Exception('Server error');
      }
    } catch (e) {
      print('$e from getting list of creator jobs');
      print(e);
      throw Exception('Server error');
    }
  }
}
