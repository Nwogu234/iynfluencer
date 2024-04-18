import 'package:get/get.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [search_filter_bottomsheet],
/// and is typically used to hold data that is passed between different parts of the application.
class SearchFilterModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(id: 0, title: "Select Category"),
    SelectionPopupModel(
        id: 1, title: "Fashion & Style",value: "Fashion & Style"),
    SelectionPopupModel(id: 2, title: "Beauty", value: "Beauty"),
    SelectionPopupModel(
        id: 3, title: "Health & Fitness", value: "Health & Fitness"),
    SelectionPopupModel(id: 4, title: "Travel", value: "Travel"),
    SelectionPopupModel(
        id: 5, title: "Food & Cooking", value: "Food & Cooking"),
    SelectionPopupModel(
        id: 6, title: "Parenting & Family", value: "Parenting & Family"),
    SelectionPopupModel(id: 7, title: "Tech & Gaming", value: "Tech & Gaming"),
    SelectionPopupModel(
        id: 8,
        title: "Home & Interior Design",
        value: "Home & Interior Design"),
    SelectionPopupModel(
        id: 9, title: "Finance & Investment", value: "Finance & Investment"),
    SelectionPopupModel(
        id: 10,
        title: "Entertainment & Celebrity",
        value: "Entertainment & Celebrity"),
    SelectionPopupModel(
        id: 11, title: "Art & DIY Craft", value: "Art & DIY Craft"),
    SelectionPopupModel(
        id: 12,
        title: "Sustainability & Eco-friendly",
        value: "Sustainability & Eco-friendly"),
    SelectionPopupModel(
        id: 13, title: "Education & Career", value: "Education & Career"),
    SelectionPopupModel(
        id: 14, title: "Science & Technology", value: "Science & Technology"),
    SelectionPopupModel(id: 15, title: "Others", value: "Others"),  
    ]);
 
  Rx<List<SelectionPopupModel>> dropdownItemList1 = Rx([
    SelectionPopupModel(id: 0, title: "Select Country"),
    SelectionPopupModel(id:1, title: 'Afghanistan', code: '+93', flag: '🇦🇫'),
    SelectionPopupModel(id:2, title: 'Algeria', code: '+213', flag: '🇩🇿'),
    SelectionPopupModel(id:3, title: 'Angola', code: '+244', flag: '🇦🇴'),
    SelectionPopupModel(id:4, title: 'Argentina', code: '+54', flag: '🇦🇷'),
    SelectionPopupModel(id:5, title: 'Australia', code: '+61', flag: '🇦🇺'),
    SelectionPopupModel(id:6, title:'Austria', code: '+43', flag: '🇦🇹'),
    SelectionPopupModel(id:7, title: 'Belgium', code: '+32', flag: '🇧🇪'),
    SelectionPopupModel(id:8, title: 'Brazil', code: '+55', flag:'🇧🇷' ),
    SelectionPopupModel(id:9, title: 'Cameroon', code: '+237', flag: '🇨🇲'),
    SelectionPopupModel(id:10, title: 'Canada', code: '+1', flag:'🇨🇦'),
    SelectionPopupModel(id:11, title: 'Chile', code: '+56', flag:'🇨🇱' ),
    SelectionPopupModel(id:10, title: 'China', code: '+86', flag: '🇨🇳'),
    SelectionPopupModel(id:11, title: 'Colombia', code: '+57', flag: '🇨🇴'),
    SelectionPopupModel(id:12, title: 'Croatia', code: '+385', flag: '🇭🇷'),
    SelectionPopupModel(id:13, title: 'Denmark', code: '+45', flag:'🇩🇰'),
    SelectionPopupModel(id:14, title: 'Egypt', code: '+20', flag:'🇪🇬'),
    SelectionPopupModel(id:15, title: 'France', code: '+33', flag: '🇫🇷'),
    SelectionPopupModel(id:16, title: 'Germany', code: '+49', flag: '🇩🇪'),
    SelectionPopupModel(id:17, title: 'Ghana', code: '+233', flag: '🇬🇭'),
    SelectionPopupModel(id:18, title: 'Greece', code: '+30', flag: '🇬🇷'),
    SelectionPopupModel(id:19, title: 'India', code: '+91', flag: '🇮🇳'),
    SelectionPopupModel(id:20, title: 'Indonesia', code: '+62', flag: '🇮🇩'),
    SelectionPopupModel(id:21, title: 'Italy', code: '+39', flag:'🇮🇹'),
    SelectionPopupModel(id:22, title: 'Ivory Coast', code:'+225' , flag: '🇨🇮'),
    SelectionPopupModel(id:23, title: 'Jamaica', code: '+1-876', flag: '🇯🇲'),
    SelectionPopupModel(id:24, title: 'Japan', code: '+81', flag: '🇯🇵'),
    SelectionPopupModel(id:25, title: 'Kenya', code: '+254', flag: '🇰🇪'),
    SelectionPopupModel(id:26, title: 'Mexico', code: '+52', flag: '🇲🇽'),
    SelectionPopupModel(id:27, title: 'Morocco', code: '+212', flag: '🇲🇦'),
    SelectionPopupModel(id:28, title: 'Netherlands', code: '+31', flag: '🇳🇱'),
    SelectionPopupModel(id:29, title: 'New Zealand', code: '+64', flag: '🇳🇿'),
    SelectionPopupModel(id:30, title: 'Nigeria', code: '+234', flag: '🇳🇬'),
    SelectionPopupModel(id:31, title: 'North Korea', code: '+850', flag: '🇰🇵'),
    SelectionPopupModel(id:32, title: 'Norway', code: '+47', flag: '🇳🇴'),
    SelectionPopupModel(id:33, title: 'Paraguay', code: '+595', flag: '🇵🇾'),
    SelectionPopupModel(id:34, title: 'Philippines', code: '+63', flag: '🇵🇭'),
    SelectionPopupModel(id:35, title: 'Poland', code: '+48', flag:'🇵🇱' ),
    SelectionPopupModel(id:36, title: 'Portugal', code: '+351', flag: '🇵🇹'),
    SelectionPopupModel(id:37, title: 'Qatar', code: '+974', flag: '🇶🇦'),
    SelectionPopupModel(id:38, title: 'Russia', code: '+7', flag: '🇷🇺'),
    SelectionPopupModel(id:39, title: 'Saudi Arabia', code: '+966', flag: '🇸🇦'),
    SelectionPopupModel(id:40, title: 'Senegal', code: '+221', flag: '🇸🇳'),
    SelectionPopupModel(id:41, title: 'Serbia', code: '+381', flag: '🇷🇸'),
    SelectionPopupModel(id:42, title: 'Singapore', code: '+65', flag: '🇸🇬'),
    SelectionPopupModel(id:43, title: 'South Africa', code: '+27', flag: '🇿🇦'),
    SelectionPopupModel(id:44, title: 'South Korea', code: '+82', flag:'🇰🇷'),
    SelectionPopupModel(id:45, title: 'Spain', code: '+34', flag:'🇪🇸'),
    SelectionPopupModel(id:46, title: 'Sweden', code: '+46', flag: '🇸🇪'),
    SelectionPopupModel(id:47, title: 'Switzerland', code:'+41', flag:'🇨🇭'),
    SelectionPopupModel(id:48, title: 'Thailand', code: '+66', flag: '🇹🇭'),
    SelectionPopupModel(id:49, title: 'Tunisia', code: '+216', flag: '🇹🇳'),
    SelectionPopupModel(id:50, title: 'Turkey', code: '+90', flag: '🇹🇷'),
    SelectionPopupModel(id:51, title: 'Ukraine', code: '+380', flag: '🇺🇦'),
    SelectionPopupModel(id:52, title: 'United Arab Emirates', code: '+971', flag:'🇦🇪'),
    SelectionPopupModel(id:53, title: 'United Kingdom', code:'+44', flag:'🇬🇧'),
    SelectionPopupModel(id:54, title: 'United States', code: '+1', flag: '🇺🇸'),
    SelectionPopupModel(id:55, title: 'Uruguay', code: '+598', flag:'🇺🇾'),
    ]);

 // Rx<List<SelectionPopupModel>> dropdownItemList2 = Rx([SelectionPopupModel(id:1,title:"Item One",isSelected:true,),SelectionPopupModel(id:2,title:"Item Two",),SelectionPopupModel(id:3,title:"Item Three",)]);

 }
