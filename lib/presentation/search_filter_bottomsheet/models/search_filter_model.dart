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
 
  Rx<List<SelectionPopupModel>>dropdownItemList1 = Rx([
    SelectionPopupModel(id: 0, title: "Select Country"),
    SelectionPopupModel(id:1, title: 'Afghanistan'),
    SelectionPopupModel(id:2, title: 'Algeria'),
    SelectionPopupModel(id:3, title: 'Angola'),
    SelectionPopupModel(id:4, title: 'Argentina'),
    SelectionPopupModel(id:5, title: 'Australia'),
    SelectionPopupModel(id:6, title:'Austria'),
    SelectionPopupModel(id:7, title: 'Belgium'),
    SelectionPopupModel(id:8, title: 'Brazil'),
    SelectionPopupModel(id:9, title: 'Cameroon'),
    SelectionPopupModel(id:10, title: 'Canada'),
    SelectionPopupModel(id:11, title: 'Chile'),
    SelectionPopupModel(id:10, title: 'China'),
    SelectionPopupModel(id:11, title: 'Colombia'),
    SelectionPopupModel(id:12, title: 'Croatia'),
    SelectionPopupModel(id:13, title: 'Denmark'),
    SelectionPopupModel(id:14, title: 'Egypt'),
    SelectionPopupModel(id:15, title: 'France'),
    SelectionPopupModel(id:16, title: 'Germany'),
    SelectionPopupModel(id:17, title: 'Ghana'),
    SelectionPopupModel(id:18, title: 'Greece'),
    SelectionPopupModel(id:19, title: 'India'),
    SelectionPopupModel(id:20, title: 'Indonesia'),
    SelectionPopupModel(id:21, title: 'Italy'),
    SelectionPopupModel(id:22, title: 'Ivory Coast'),
    SelectionPopupModel(id:23, title: 'Jamaica'),
    SelectionPopupModel(id:24, title: 'Japan'),
    SelectionPopupModel(id:25, title: 'Kenya'),
    SelectionPopupModel(id:26, title: 'Mexico'),
    SelectionPopupModel(id:27, title: 'Morocco'),
    SelectionPopupModel(id:28, title: 'Netherlands'),
    SelectionPopupModel(id:29, title: 'New Zealand'),
    SelectionPopupModel(id:30, title: 'Nigeria'),
    SelectionPopupModel(id:31, title: 'North Korea'),
    SelectionPopupModel(id:32, title: 'Norway'),
    SelectionPopupModel(id:33, title: 'Paraguay'),
    SelectionPopupModel(id:34, title: 'Philippines'),
    SelectionPopupModel(id:35, title: 'Poland'),
    SelectionPopupModel(id:36, title: 'Portugal'),
    SelectionPopupModel(id:37, title: 'Qatar'),
    SelectionPopupModel(id:38, title: 'Russia'),
    SelectionPopupModel(id:39, title: 'Saudi Arabia'),
    SelectionPopupModel(id:40, title: 'Senegal'),
    SelectionPopupModel(id:41, title: 'Serbia'),
    SelectionPopupModel(id:42, title: 'Singapore'),
    SelectionPopupModel(id:43, title: 'South Africa'),
    SelectionPopupModel(id:44, title: 'South Korea'),
    SelectionPopupModel(id:45, title: 'Spain'),
    SelectionPopupModel(id:46, title: 'Sweden'),
    SelectionPopupModel(id:47, title: 'Switzerland'),
    SelectionPopupModel(id:48, title: 'Thailand'),
    SelectionPopupModel(id:49, title: 'Tunisia'),
    SelectionPopupModel(id:50, title: 'Turkey'),
    SelectionPopupModel(id:51, title: 'Ukraine'),
    SelectionPopupModel(id:52, title: 'United Arab Emirates'),
    SelectionPopupModel(id:53, title: 'United Kingdom'),
    SelectionPopupModel(id:54, title: 'United States'),
    SelectionPopupModel(id:55, title: 'Uruguay'),
    ]);

 // Rx<List<SelectionPopupModel>> dropdownItemList2 = Rx([SelectionPopupModel(id:1,title:"Item One",isSelected:true,),SelectionPopupModel(id:2,title:"Item Two",),SelectionPopupModel(id:3,title:"Item Three",)]);

 }
