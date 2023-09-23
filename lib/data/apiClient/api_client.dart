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
  Future<Response> createJob(Job jobRequest, var token) async {
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
  Future<List<JobsMyBidsInfluencerModel>> getInfluencerJobsBids(
      var token) async {
    Response response;
    try {
      response = await get(
        'influencers/me/bids',
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      if (response.isOk) {
        List<Map<String, dynamic>> map;
        List<JobsMyBidsInfluencerModel> theJobs = [];
        print('------------');
        // print(response.body['data']['docs']);
        // map = List<Map<String, dynamic>>.from(
        //     jsonDecode(response.body['data']['docs']));

        final dynamic jobJsonList = response.body['data']['docs'];
        // theJobs.add(JobsMyBidsInfluencerModel.fromJson(jobJsonList[0]));
        jobJsonList.forEach((e) {
          print('----from forech---');
          print(e);
          theJobs.add(JobsMyBidsInfluencerModel.fromJson(e));
        });
        // final List<Job> jobs = map
        //     .map((json) => Job(
        //           id: json['_id'],
        //           creatorId: json['creatorId'],
        //           title: json['title'],
        //           description: json['description'],
        //           responsibilities: List<String>.from(json['responsibilities']),
        //           category: List<String>.from(json['category']),
        //           budgetFrom: json['budgetFrom'],
        //           budgetTo: json['budgetTo'],
        //           duration: json['duration'],
        //           public: json['public'],
        //           hired: json['hired'],
        //           suspended: json['suspended'],
        //           jobId: json['jobId'],
        //           createdAt: json['createdAt'],
        //           updatedAt: json['updatedAt'],
        //           version: json['__v'],
        //           creator: (json['creator'] as List)
        //               .map((i) => Creator.fromJson(i))
        //               .toList(),
        //           bidsCount: json['bidsCount'],
        //         ))
        //     .toList();
        return theJobs.toList();
      } else {
        print(response);
        print(response.body);
        throw Exception('Server error From Jobs');
      }
    } catch (e) {
      print('$e from getting list of influencers job nids');
      print(e);
      throw Exception('Server error From influencers job  2');
    }
  }
}
