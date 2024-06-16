import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/use_model/user_model.dart';
import 'package:iynfluencer/presentation/bid_screen/models/bid_model.dart';
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
        'https://iynf-kong-akbf9.ondigitalocean.app/api/v1/';
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
        return Get.offAllNamed(
          AppRoutes.logInScreen,
        );
      case 403:
        throw 'Error occurred pls check internet and retry.';
      case 500:
      default:
        throw response.body['message'] ?? 'Error occurred Retry';
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
        print(response.body['message']);
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

  //this is for getting url to upload user pic
  Future<Response> getPicUrl(String filePath, String token) async {
  try {
    final file = File(filePath);
    final List<int> fileBytes = await file.readAsBytesSync();
    final formData = FormData({
      'image': MultipartFile(
       fileBytes,
       filename: 'avatar.jpg',
      contentType: 'image/jpeg',
  ),
});
    return post(
      'users/me/upload_media_url',
      formData,
      headers: {
        'Authorization': token,
      },
    );
  } catch (e) {
    print(e);
    throw Exception('Error uploading image');
  }
}


  

  // this is for updating profile pic url
  Future<Response> postAvatar(String avatarUrl, String token) {
    print("this is the one we are looking for $avatarUrl");
    return post(
      'users/me/save_avatar', {"avatar": avatarUrl},
      // replace with your specific endpoint path
      headers: {
        "Content-Type": "application/json",
        'Authorization': token,
      },
    );
  }

  // THIS IS FOR UPDATING USER DETAILS
  Future<Response> updateUser(UpdateUser update, var token) async {
    Response response;
    try {
      response = await patch('users/me', update.toJson(), headers: {
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
      response = await post('influencers/me', profile.toJson(), headers: {
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


  //patch request for updating a creator profile
  Future<Response> updateCreatorProfile(
      CompleteProfileCreatorModel profile, var token) async {
    Response response;
    try {
      response = await patch('creators/me', profile.toJson(), headers: {
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

//patch request for updating an influencer profile
  Future<Response> updateInfluencerProfile(
      CompleteProfileInfluencerModel profile, var token) async {
    Response response;
    try {
      response = await patch('influencers/me', profile.toJson(), headers: {
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
        throw Exception('Server error');
      }
    } catch (e) {
      print('$e from updating influencer profile');
      print(e);
      throw Exception('Server error');
    }
  }

  //Getting creator profile
  Future<Response> getCreatorProfile(var token) async {
    Response response;
    try {
      response = await get(
        'creators/me',
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

  // Future<Response> getAllJobs(token) async {
  //   Response response;
  //   try {
  //     response = await get(
  //       'creators/jobs',
  //       headers: {
  //         "Content-Type": "application/json",
  //         'Authorization': token,
  //       },
  //     );
  //     if (response.isOk) {
  //       return response;
  //     } else {
  //       print(response);
  //       print(response.body);
  //       throw Exception('Server error');
  //     }
  //   } catch (e) {
  //     print('$e from getting list of influencers');
  //     print(e);
  //     throw Exception('Server error');
  //   }
  // }

  Future<Response> sendJobRequestService(SendJobRequest body, token) async {
    Response response = Response();
    try {
      response = await post(
        'creators/me/jobs/request/send',
        body.toJson(),
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
        throw response;
      }
    } catch (e) {
      print('$e Error Sending Job Request');
      print(e);
      throw e;
    }
  }

  //List of existing jobs of an influencer
  Future<Response> getInfluencerAllJobs(String influencerId, var token) async {
    Response response;
    try {
      response = await get(
        'creators/jobs/influencer',
        // 'creators/jobs?influencerId=$influencerId',
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

//this is for posting a new bid
  Future<Response> bidAJob(BidModel bidRequest, var token) async {
    Response response;
    try {
      response =
          await post('influencers/me/bids', bidRequest.toJson(), headers: {
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
        // throw Exception('Server error');
      }
    } catch (e) {
      print(e);
      throw Exception('Server error');
    }
  }

  //this is for updating a current bid
    Future<Response> updateBid(BidModel bidRequest, var token, String bidId) async {
    Response response;
    try {
      response = await patch(
        'influencers/me/bids/$bidId/single',
        bidRequest.toJson(), 
        headers: {
        "Content-Type": "application/json",
        'Authorization': token,
      });
      if (response.isOk) {
        return response;
      } else {
        print(response);
        print(response.body);
        print(response.statusCode);
        print(bidRequest.toJson());
        print('Server error: ${response.statusText} ${response.statusCode}, ${response.body}');
        throw Exception('Server error');
      }
    } catch (e) {
      print('$e from updating influencer bid');
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
//Get Job requests fro an influencer
  Future<Response> getInfluencerJobsRequests(
    var token,
  ) async {
    Response response = Response();
    try {
      response = await get(
        'influencers/me/jobs/requests',
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

  //Descline Request for influencer
  Future<Response> InfluencerDeclineJobsRequests(var token, String id) async {
    Response response = Response();
    try {
      response = await post(
        'influencers/me/jobs/request/$id/decline',
        {},
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
        throw Exception('Server error From Job Request');
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

      throw Exception('Server error');
    }
  }

  Future<Response> getAllBidsForAJob(String jobid, var token) async {
    Response response = Response();
    try {
      response = await get(
        'influencers/bids?jobId=$jobid',
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
      errorHandler(response);

      throw Exception('Server error');
    }
  }

  Future<Response> hireInfluencerForAJob(String bidId, var token) async {
    Response response = Response();
    try {
      response = await post(
        'creators/me/hires/bid/$bidId',
        null,
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      if (response.isOk) {
        return response;
      } else {
          print('Failed to delete message: ${response.statusCode}, ${response.body}');
        throw response.body['message'];
      }
    } catch (e) {
      print('hireInfluencerForAJob');
      print(e);
      errorHandler(response);
      throw e;
    }
  }
}
