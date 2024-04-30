import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/use_model/user_model.dart';
import '../apiClient/api_client.dart';

/// A controller class for the InfluencerHomeScreen.
///
/// This class manages the state of the InfluencerHomeScreen, including the
/// current influencerHomeModelObj

//final DateFormat dateFormat = DateFormat('E dd MMM yy');
//dateFormat.format(DateTime.now()),

class UserController extends GetxController {
  Rx<UserModel> userModelObj = UserModel(
          firstName: "",
          phone: '',
          country: '',
          countryCode: '',
          dob: DateTime.now().toString(),
          lastName: "",
          email: "",
          termsAndConditionsAgreement: true,
          isNewUser: true,
          isSocial: false,
          verified: false,
          verifiedEmail: false,
          followers: 0,
          following: 0,
          views: 0,
          userId: "",
          createdAt: DateTime.parse("2023-06-05T20:35:42.936Z"),
          updatedAt: DateTime.parse("2023-06-05T20:35:42.936Z"),
          creatorId: null,
          influencerId: null,
          id: '',
          avatar: '')
      .obs;
  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();
  String baseUrl =
   'https://iynfluencer.s3.us-east-1.amazonaws.com/';

  // 'https://iynf-kong-akbf9.ondigitalocean.app/';

  String getCountryCode(String countryName) {
    for (var entry in countries.entries) {
      if (entry.value == countryName) {
        return entry.key;
      }
    }
    return ''; // Country name not found
  }
  String capitalizeFirstLetter(String? text) {
    if (text == null || text.isEmpty) {
      return '';
    }
    return text.split(' ').map((word) {
      if (word.isEmpty) {
        return '';
      }
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
  }


  getUser() async {
    token = await storage.read(key: "token");
    try {
      userModelObj.value = await apiClient.getUser(token!);
      if (userModelObj.value.firstName.isEmpty) {
        return ('Something went wrong');
      } else {
        print('Original dob: ${userModelObj.value.dob}');
        print(userModelObj.value.avatar);
        userModelObj.value.avatar="$baseUrl${userModelObj.value.avatar}";
        userModelObj.value.countryCode =
            getCountryCode(capitalizeFirstLetter(userModelObj.value.country!));

        userModelObj.value.dob = formatDob(userModelObj.value.dob);
         print('Formatted dob: ${userModelObj.value.dob}');
        return ('Its Ok');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadUserPic(String filePath) async {
    Get.dialog(
      Center(child: CircularProgressIndicator()), // showing a loading dialog
      barrierDismissible: false, // user must not close it manually
    );
    token = await storage.read(key: "token");
    // 1. Get the pre-signed URL from your backend
    final response = await apiClient.getPicUrl(token);

    if (!response.isOk) {
      Get.back();
      Get.snackbar('Error', 'Failed to upload image. Please try again.');
      print('Failed to obtain pre-signed URL');
      return;
    }
    print(response.body);
    String presignedUrl = response.body['data']['uploadUrl'];

    // 2. Upload the file using the pre-signed URL
    final file = File(filePath);
    final List<int> fileBytes = file.readAsBytesSync();

    final uploadResponse = await http.post(
      Uri.parse(presignedUrl),
      headers: {
        'Content-Type':
            'image/jpeg', // This should match what you set in the backend
      },
      body: fileBytes,
    );

    if (uploadResponse.statusCode == 200) {
      print('File successfully uploaded');
      String picUrl = presignedUrl.split('?').first;
      // Splitting the URL based on '/'
      List<String> parts = picUrl.split('/');

      // Extracting the desired part
      String desiredPart = parts.sublist(3).join('/');
      print(desiredPart);
      final response = await apiClient.postAvatar(desiredPart, token);
      if (response.isOk) {
        Get.back();
        Get.snackbar('Success', 'Image uploaded');
        print('Success: ${response.body}');
      } else {
        Get.back();
        Get.snackbar('Error', 'Failed to upload image. Please try again.');
        print('Error: ${response.body}');
      }
      print(uploadResponse.body);
    } else {
      Get.back();
      Get.snackbar('Error', 'Failed to upload image. Please try again.');
      print('File upload failed');
    }
  }


String formatDob(String? dob) {
  if (dob == null) {
    return ''; 
  }

  // Define the input date format
  final DateFormat inputFormat = DateFormat('EEE MMM dd yyyy HH:mm:ss \'GMT\'Z (z)');

  // Define the output date format
  final DateFormat outputFormat = DateFormat('E dd MMM yy');

  try {
    // Parse the input date string
    final DateTime parsedDate = inputFormat.parse(dob);

    return outputFormat.format(parsedDate);
  } catch (e) {
    return dob;
  }
}


  ///the list of countries
  Map<String, String> countries = {
    "AF": "Afghanistan",
    "AX": "Åland Islands",
    "AL": "Albania",
    "DZ": "Algeria",
    "AS": "American Samoa",
    "AD": "Andorra",
    "AO": "Angola",
    "AI": "Anguilla",
    "AQ": "Antarctica",
    "AG": "Antigua and Barbuda",
    "AR": "Argentina",
    "AM": "Armenia",
    "AW": "Aruba",
    "AU": "Australia",
    "AT": "Austria",
    "AZ": "Azerbaijan",
    "BS": "Bahamas",
    "BH": "Bahrain",
    "BD": "Bangladesh",
    "BB": "Barbados",
    "BY": "Belarus",
    "BE": "Belgium",
    "BZ": "Belize",
    "BJ": "Benin",
    "BM": "Bermuda",
    "BT": "Bhutan",
    "BO": "Bolivia",
    "BQ": "Bonaire, Sint Eustatius and Saba",
    "BA": "Bosnia and Herzegovina",
    "BW": "Botswana",
    "BV": "Bouvet Island",
    "BR": "Brazil",
    "IO": "British Indian Ocean Territory",
    "BN": "Brunei Darussalam",
    "BG": "Bulgaria",
    "BF": "Burkina Faso",
    "BI": "Burundi",
    "CV": "Cabo Verde",
    "KH": "Cambodia",
    "CM": "Cameroon",
    "CA": "Canada",
    "KY": "Cayman Islands",
    "CF": "Central African Republic",
    "TD": "Chad",
    "CL": "Chile",
    "CN": "China",
    "CX": "Christmas Island",
    "CC": "Cocos (Keeling) Islands",
    "CO": "Colombia",
    "KM": "Comoros",
    "CG": "Congo",
    "CD": "Congo, Democratic Republic of the",
    "CK": "Cook Islands",
    "CR": "Costa Rica",
    "CI": "Côte d'Ivoire",
    "HR": "Croatia",
    "CU": "Cuba",
    "CW": "Curaçao",
    "CY": "Cyprus",
    "CZ": "Czech Republic",
    "DK": "Denmark",
    "DJ": "Djibouti",
    "DM": "Dominica",
    "DO": "Dominican Republic",
    "EC": "Ecuador",
    "EG": "Egypt",
    "SV": "El Salvador",
    "GQ": "Equatorial Guinea",
    "ER": "Eritrea",
    "EE": "Estonia",
    "SZ": "Eswatini",
    "ET": "Ethiopia",
    "FK": "Falkland Islands (Malvinas)",
    "FO": "Faroe Islands",
    "FJ": "Fiji",
    "FI": "Finland",
    "FR": "France",
    "GF": "French Guiana",
    "PF": "French Polynesia",
    "TF": "French Southern Territories",
    "GA": "Gabon",
    "GM": "Gambia",
    "GE": "Georgia",
    "DE": "Germany",
    "GH": "Ghana",
    "GI": "Gibraltar",
    "GR": "Greece",
    "GL": "Greenland",
    "GD": "Grenada",
    "GP": "Guadeloupe",
    "GU": "Guam",
    "GT": "Guatemala",
    "GG": "Guernsey",
    "GN": "Guinea",
    "GW": "Guinea-Bissau",
    "GY": "Guyana",
    "HT": "Haiti",
    "HM": "Heard Island and McDonald Islands",
    "VA": "Holy See",
    "HN": "Honduras",
    "HK": "Hong Kong",
    "HU": "Hungary",
    "IS": "Iceland",
    "IN": "India",
    "ID": "Indonesia",
    "IR": "Iran",
    "IQ": "Iraq",
    "IE": "Ireland",
    "IM": "Isle of Man",
    "IL": "Israel",
    "IT": "Italy",
    "JM": "Jamaica",
    "JP": "Japan",
    "JO": "Jordan",
    "KZ": "Kazakhstan",
    "KE": "Kenya",
    "KI": "Kiribati",
    "KW": "Kuwait",
    "KG": "Kyrgyzstan",
    "LA": "Laos",
    "LV": "Latvia",
    "LB": "Lebanon",
    "LS": "Lesotho",
    "LR": "Liberia",
    "LY": "Libya",
    "LI": "Liechtenstein",
    "LT": "Lithuania",
    "LU": "Luxembourg",
    "MG": "Madagascar",
    "MW": "Malawi",
    "MY": "Malaysia",
    "MV": "Maldives",
    "ML": "Mali",
    "MT": "Malta",
    "MH": "Marshall Islands",
    "MR": "Mauritania",
    "MU": "Mauritius",
    "MX": "Mexico",
    "FM": "Micronesia",
    "MD": "Moldova",
    "MC": "Monaco",
    "MN": "Mongolia",
    "ME": "Montenegro",
    "MA": "Morocco",
    "MZ": "Mozambique",
    "MM": "Myanmar (formerly Burma)",
    "NA": "Namibia",
    "NR": "Nauru",
    "NP": "Nepal",
    "NL": "Netherlands",
    "NZ": "New Zealand",
    "NI": "Nicaragua",
    "NE": "Niger",
    "NG": "Nigeria",
    "KP": "North Korea",
    "MK": "North Macedonia (formerly Macedonia)",
    "NO": "Norway",
    "OM": "Oman",
    "PK": "Pakistan",
    "PW": "Palau",
    "PS": "Palestine State",
    "PA": "Panama",
    "PG": "Papua New Guinea",
    "PY": "Paraguay",
    "PE": "Peru",
    "PH": "Philippines",
    "PL": "Poland",
    "PT": "Portugal",
    "QA": "Qatar",
    "RO": "Romania",
    "RU": "Russia",
    "RW": "Rwanda",
    "KN": "Saint Kitts and Nevis",
    "LC": "Saint Lucia",
    "VC": "Saint Vincent and the Grenadines",
    "WS": "Samoa",
    "SM": "San Marino",
    "ST": "Sao Tome and Principe",
    "SA": "Saudi Arabia",
    "SN": "Senegal",
    "RS": "Serbia",
    "SC": "Seychelles",
    "SL": "Sierra Leone",
    "SG": "Singapore",
    "SK": "Slovakia",
    "SI": "Slovenia",
    "SB": "Solomon Islands",
    "SO": "Somalia",
    "ZA": "South Africa",
    "KR": "South Korea",
    "SS": "South Sudan",
    "ES": "Spain",
    "LK": "Sri Lanka",
    "SD": "Sudan",
    "SR": "Suriname",
    "SE": "Sweden",
    "CH": "Switzerland",
    "SY": "Syria",
    "TJ": "Tajikistan",
    "TZ": "Tanzania",
    "TH": "Thailand",
    "TL": "Timor-Leste",
    "TG": "Togo",
    "TO": "Tonga",
    "TT": "Trinidad and Tobago",
    "TN": "Tunisia",
    "TR": "Turkey",
    "TM": "Turkmenistan",
    "TV": "Tuvalu",
    "UG": "Uganda",
    "UA": "Ukraine",
    "AE": "United Arab Emirates",
    "GB": "United Kingdom",
    "US": "United States of America",
    "UY": "Uruguay",
    "UZ": "Uzbekistan",
    "VU": "Vanuatu",
    "VE": "Venezuela",
    "VN": "Vietnam",
    "YE": "Yemen",
    "ZM": "Zambia",
    "ZW": "Zimbabwe"
  };
  @override
  void onClose() {
    super.onClose();
  }
}