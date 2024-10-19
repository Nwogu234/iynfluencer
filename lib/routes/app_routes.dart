import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/data/models/Socials/social.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/all_home_screen.dart/all_home_screen.dart';
import 'package:iynfluencer/presentation/all_home_screen.dart/binding/all_home_page_binding.dart';
import 'package:iynfluencer/presentation/bid_accepted_screen/bid_accepted_screen.dart';
import 'package:iynfluencer/presentation/bid_accepted_screen/binding/bid_accepted_binding.dart';
import 'package:iynfluencer/presentation/complete_job_screen/binding/complete_job_binding.dart';
import 'package:iynfluencer/presentation/complete_job_screen/complete_job_screen.dart';
import 'package:iynfluencer/presentation/creator_after_job_detail_screen/binding/creator_after_job_detail_binding.dart';
import 'package:iynfluencer/presentation/creator_after_job_detail_screen/creator_after_job_detail_screen.dart';
import 'package:iynfluencer/presentation/earning_menu_tab/binding/earning_tab_binding.dart';
import 'package:iynfluencer/presentation/earning_menu_tab/earning_menu_tab_screen.dart';
import 'package:iynfluencer/presentation/edit_bid_screen/binding/edit_binding.dart';
import 'package:iynfluencer/presentation/edit_bid_screen/edit_bid_screen.dart';
import 'package:iynfluencer/presentation/edit_profile_listed_jobs_tab_two_container_screen/binding/edit_profile_listed_jobs_tab_two_container_binding.dart';
import 'package:iynfluencer/presentation/email_forget_screen/email_forget_screen.dart';
import 'package:iynfluencer/presentation/fashion_home_screen.dart/binding/fashion_home_screen_binding.dart';
import 'package:iynfluencer/presentation/fashion_home_screen.dart/fashion_home_screeen.dart';
import 'package:iynfluencer/presentation/home_creator_container_screen/home_creator_container_screen.dart';
import 'package:iynfluencer/presentation/home_creator_container_screen/binding/home_creator_container_binding.dart';
import 'package:iynfluencer/presentation/influencer_job_tab_screen/binding/influencer_job_tab_binding.dart';
import 'package:iynfluencer/presentation/influencer_job_tab_screen/influencer_job_tab_screen.dart';
import 'package:iynfluencer/presentation/job_accepted_screen/binding/job_accepted_binding.dart';
import 'package:iynfluencer/presentation/job_accepted_screen/job_accepted_screen.dart';
import 'package:iynfluencer/presentation/job_hired_screen/binding/job_hired_binding.dart';
import 'package:iynfluencer/presentation/job_hired_screen/job_hired_screen.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/messages_page_influencer_page.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/models/messages_page_influencer_model.dart';
import 'package:iynfluencer/presentation/notification_firestore/binding/notification_firestore_binding.dart';
import 'package:iynfluencer/presentation/notification_firestore/notification_firestore.dart';
import 'package:iynfluencer/presentation/reset_password_screen/binding/reset_password_binding.dart';
import 'package:iynfluencer/presentation/reset_password_screen/reset_password_screen.dart';
import 'package:iynfluencer/presentation/review_accepted_screen/binding/review_accepted_binding.dart';
import 'package:iynfluencer/presentation/review_accepted_screen/review_accepted_screen.dart';
import 'package:iynfluencer/presentation/social_media_home_screen.dart/binding/social_media_home_page_binding.dart';
import 'package:iynfluencer/presentation/social_media_home_screen.dart/social_media_home_page.dart';
import 'package:iynfluencer/presentation/splash_screen/splash_screen.dart';
import 'package:iynfluencer/presentation/splash_screen/binding/splash_binding.dart';
import 'package:iynfluencer/presentation/onboarding_screen_one_screen/onboarding_screen_one_screen.dart';
import 'package:iynfluencer/presentation/onboarding_screen_one_screen/binding/onboarding_screen_one_binding.dart';
import 'package:iynfluencer/presentation/onboarding_screen_two_screen/onboarding_screen_two_screen.dart';
import 'package:iynfluencer/presentation/onboarding_screen_two_screen/binding/onboarding_screen_two_binding.dart';
import 'package:iynfluencer/presentation/onboarding_screen_three_screen/onboarding_screen_three_screen.dart';
import 'package:iynfluencer/presentation/onboarding_screen_three_screen/binding/onboarding_screen_three_binding.dart';
import 'package:iynfluencer/presentation/log_in_screen/log_in_screen.dart';
import 'package:iynfluencer/presentation/log_in_screen/binding/log_in_binding.dart';
import 'package:iynfluencer/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:iynfluencer/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:iynfluencer/presentation/phone_verification_screen/phone_verification_screen.dart';
import 'package:iynfluencer/presentation/phone_verification_screen/binding/phone_verification_binding.dart';
import 'package:iynfluencer/presentation/confirm_code_screen/confirm_code_screen.dart';
import 'package:iynfluencer/presentation/confirm_code_screen/binding/confirm_code_binding.dart';
import 'package:iynfluencer/presentation/complete_profile_creator_screen/complete_profile_creator_screen.dart';
import 'package:iynfluencer/presentation/complete_profile_creator_screen/binding/complete_profile_creator_binding.dart';
import 'package:iynfluencer/presentation/complete_profile_influencer_screen/complete_profile_influencer_screen.dart';
import 'package:iynfluencer/presentation/complete_profile_influencer_screen/binding/complete_profile_influencer_binding.dart';
import 'package:iynfluencer/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:iynfluencer/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:iynfluencer/presentation/bids_screen/bids_screen.dart';
import 'package:iynfluencer/presentation/bids_screen/binding/bids_binding.dart';
import 'package:iynfluencer/presentation/bid_request_screen/bid_request_screen.dart';
import 'package:iynfluencer/presentation/bid_request_screen/binding/bid_request_binding.dart';
import 'package:iynfluencer/presentation/job_client_screen/job_client_screen.dart';
import 'package:iynfluencer/presentation/job_client_screen/binding/job_client_binding.dart';
import 'package:iynfluencer/presentation/search_influncers_screen/search_influncers_screen.dart';
import 'package:iynfluencer/presentation/search_influncers_screen/binding/search_influncers_binding.dart';
import 'package:iynfluencer/presentation/search_results_screen/search_results_screen.dart';
import 'package:iynfluencer/presentation/search_results_screen/binding/search_results_binding.dart';
import 'package:iynfluencer/presentation/influencer_profile_comm_post_tab_container_screen/influencer_profile_comm_post_tab_container_screen.dart';
import 'package:iynfluencer/presentation/influencer_profile_comm_post_tab_container_screen/binding/influencer_profile_comm_post_tab_container_binding.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/chats_opened_screen.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/binding/chats_opened_binding.dart';
import 'package:iynfluencer/presentation/edit_profile_listed_jobs_tab_container_screen/edit_profile_listed_jobs_tab_container_screen.dart';
import 'package:iynfluencer/presentation/edit_profile_listed_jobs_tab_container_screen/binding/edit_profile_listed_jobs_tab_container_binding.dart';
import 'package:iynfluencer/presentation/edit_profile_details_screen/edit_profile_details_screen.dart';
import 'package:iynfluencer/presentation/edit_profile_details_screen/binding/edit_profile_details_binding.dart';
import 'package:iynfluencer/presentation/notification_mentions_screen/notification_mentions_screen.dart';
import 'package:iynfluencer/presentation/notification_mentions_screen/binding/notification_mentions_binding.dart';
import 'package:iynfluencer/presentation/notification_bids_screen/notification_bids_screen.dart';
import 'package:iynfluencer/presentation/notification_bids_screen/binding/notification_bids_binding.dart';
import 'package:iynfluencer/presentation/notification_liked_post_screen/notification_liked_post_screen.dart';
import 'package:iynfluencer/presentation/notification_liked_post_screen/binding/notification_liked_post_binding.dart';
import 'package:iynfluencer/presentation/notification_page_client_screen/notification_page_client_screen.dart';
import 'package:iynfluencer/presentation/notification_page_client_screen/binding/notification_page_client_binding.dart';
import 'package:iynfluencer/presentation/search_creator_screen/search_creator_screen.dart';
import 'package:iynfluencer/presentation/search_creator_screen/binding/search_creator_binding.dart';
import 'package:iynfluencer/presentation/creator_profile_comm_posts_tab_container_screen/creator_profile_comm_posts_tab_container_screen.dart';
import 'package:iynfluencer/presentation/creator_profile_comm_posts_tab_container_screen/binding/creator_profile_comm_posts_tab_container_binding.dart';
import 'package:iynfluencer/presentation/creator_profile_reveiws_tab_container_screen/creator_profile_reveiws_tab_container_screen.dart';
import 'package:iynfluencer/presentation/creator_profile_reveiws_tab_container_screen/binding/creator_profile_reveiws_tab_container_binding.dart';
import 'package:iynfluencer/presentation/job_details_screen/job_details_screen.dart';
import 'package:iynfluencer/presentation/job_details_screen/binding/job_details_binding.dart';


import 'package:iynfluencer/presentation/community_influncer_screen/community_influncer_screen.dart';
import 'package:iynfluencer/presentation/community_influncer_screen/binding/community_influncer_binding.dart';
import 'package:iynfluencer/presentation/bid_screen/bid_screen.dart';
import 'package:iynfluencer/presentation/bid_screen/binding/bid_binding.dart';
import 'package:iynfluencer/presentation/edit_profile_details_one_screen/edit_profile_details_one_screen.dart';
import 'package:iynfluencer/presentation/edit_profile_details_one_screen/binding/edit_profile_details_one_binding.dart';
import 'package:iynfluencer/presentation/request_detail_screen/request_detail_screen.dart';
import 'package:iynfluencer/presentation/request_detail_screen/binding/request_detail_binding.dart';
import 'package:iynfluencer/presentation/charge_screen/charge_screen.dart';
import 'package:iynfluencer/presentation/charge_screen/binding/charge_binding.dart';
import 'package:iynfluencer/presentation/influencer_home_one_screen/influencer_home_one_screen.dart';
import 'package:iynfluencer/presentation/influencer_home_one_screen/binding/influencer_home_one_binding.dart';
import 'package:iynfluencer/presentation/notification_mentions_one_screen/notification_mentions_one_screen.dart';
import 'package:iynfluencer/presentation/notification_mentions_one_screen/binding/notification_mentions_one_binding.dart';
import 'package:iynfluencer/presentation/notification_requests_screen/notification_requests_screen.dart';
import 'package:iynfluencer/presentation/notification_requests_screen/binding/notification_requests_binding.dart';
import 'package:iynfluencer/presentation/notification_liked_post_one_screen/notification_liked_post_one_screen.dart';
import 'package:iynfluencer/presentation/notification_liked_post_one_screen/binding/notification_liked_post_one_binding.dart';
import 'package:iynfluencer/presentation/notification_page_influencer_screen/notification_page_influencer_screen.dart';
import 'package:iynfluencer/presentation/notification_page_influencer_screen/binding/notification_page_influencer_binding.dart';
import 'package:iynfluencer/presentation/earnings_screen/earnings_screen.dart';
import 'package:iynfluencer/presentation/earnings_screen/binding/earnings_binding.dart';
import 'package:iynfluencer/presentation/request_accepted_one_screen/request_accepted_one_screen.dart';
import 'package:iynfluencer/presentation/request_accepted_one_screen/binding/request_accepted_one_binding.dart';
import 'package:iynfluencer/presentation/request_accepted_screen/request_accepted_screen.dart';
import 'package:iynfluencer/presentation/request_accepted_screen/binding/request_accepted_binding.dart';
import 'package:iynfluencer/presentation/community_post_screen/community_post_screen.dart';
import 'package:iynfluencer/presentation/community_post_screen/binding/community_post_binding.dart';
import 'package:iynfluencer/presentation/comments_on_community_screen/comments_on_community_screen.dart';
import 'package:iynfluencer/presentation/comments_on_community_screen/binding/comments_on_community_binding.dart';
import 'package:iynfluencer/presentation/complet_payment_screen/complet_payment_screen.dart';
import 'package:iynfluencer/presentation/complet_payment_screen/binding/complet_payment_binding.dart';
import 'package:iynfluencer/presentation/payment_card_screen/payment_card_screen.dart';
import 'package:iynfluencer/presentation/payment_card_screen/binding/payment_card_binding.dart';
import 'package:iynfluencer/presentation/payment_transfer_screen/payment_transfer_screen.dart';
import 'package:iynfluencer/presentation/payment_transfer_screen/binding/payment_transfer_binding.dart';
import 'package:iynfluencer/presentation/dispute_screen/dispute_screen.dart';
import 'package:iynfluencer/presentation/dispute_screen/binding/dispute_binding.dart';
import 'package:iynfluencer/presentation/technology_home_screen/binding/controller/model/binding/technology_home_screen_binding.dart';
import 'package:iynfluencer/presentation/technology_home_screen/binding/controller/model/technology_home_screen.dart';
import 'package:iynfluencer/presentation/transactions_screen/binding/transaction_binding.dart';
import 'package:iynfluencer/presentation/transactions_screen/transaction_screen.dart';
import 'package:iynfluencer/presentation/withdraw_transaction/binding/withdraw_transaction_binding.dart';
import 'package:iynfluencer/presentation/withdraw_transaction/withdraw_transaction.dart';
import 'package:iynfluencer/presentation/withdrawal_screen/withdrawal_screen.dart';
import 'package:iynfluencer/presentation/withdrawal_screen/binding/withdrawal_binding.dart';
import 'package:iynfluencer/presentation/withdrawal_successful_screen/withdrawal_successful_screen.dart';
import 'package:iynfluencer/presentation/withdrawal_successful_screen/binding/withdrawal_successful_binding.dart';
import 'package:iynfluencer/presentation/payment_succesful_screen/payment_succesful_screen.dart';
import 'package:iynfluencer/presentation/payment_succesful_screen/binding/payment_succesful_binding.dart';
import 'package:iynfluencer/presentation/payment_failed_screen/payment_failed_screen.dart';
import 'package:iynfluencer/presentation/payment_failed_screen/binding/payment_failed_binding.dart';
import 'package:iynfluencer/presentation/withdrawl_failed_screen/withdrawl_failed_screen.dart';
import 'package:iynfluencer/presentation/withdrawl_failed_screen/binding/withdrawl_failed_binding.dart';
import 'package:iynfluencer/presentation/dispute_sent_screen/dispute_sent_screen.dart';
import 'package:iynfluencer/presentation/dispute_sent_screen/binding/dispute_sent_binding.dart';
import 'package:iynfluencer/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:iynfluencer/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

import '../presentation/choose_profile/choose_profile.dart';
import '../presentation/choose_profile/choose_profile_bindings/choose_profile_binding.dart';
import '../presentation/creator_job_details/binding/creator_job_details_binding.dart';
import '../presentation/creator_job_details/creator_job_details_screen.dart';
import '../presentation/edit_profile_listed_jobs_tab_two_container_screen/edit_profile_listed_jobs_tab_two_container_screen.dart';
import '../presentation/email_code/email_code.dart';
import '../presentation/email_code/email_code_bindings/email_code_bindings.dart';
import '../presentation/influencer_tabs/binding/influencer_binding.dart';
import '../presentation/influencer_tabs/infuencer_tabs.dart';
import '../presentation/settings/binding/settings_binding.dart';
import '../presentation/settings/settings_screen.dart';

class AppRoutes {
  static const String homeCreatorPage = '/home_creator_page';

  static const String homeCreatorContainerScreen =
      '/home_creator_container_screen';

  static const String splashScreen = '/splash_screen';

  static const String onboardingScreenOneScreen =
      '/onboarding_screen_one_screen';

  static const String onboardingScreenTwoScreen =
      '/onboarding_screen_two_screen';

  static const String onboardingScreenThreeScreen =
      '/onboarding_screen_three_screen';

  static const String logInScreen = '/log_in_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String phoneVerificationScreen = '/phone_verification_screen';

  static const String confirmCodeScreen = '/confirm_code_screen';

  static const String emailCodeScreen = '/email_code_screen/:param1/:param2';

  static const String emailForgetScreen = '/email_forget_screen/:param1/:param2';

  static const String completeProfileCreatorScreen =
      '/complete_profile_creator_screen';

  static const String completeProfileInfluencerScreen =
      '/complete_profile_influencer_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String resetPasswordScreen = '/reset_password_screen';

  static const String creatorJobslistPage = '/creator_jobslist_page';

  static const String creatorHireslistPage = '/creator_hireslist_page';

  static const String creatorHireslistTabContainerPage =
      '/creator_hireslist_tab_container_page';

  static const String postPageScreen = '/post_page_screen';

  static const String messagesPage = '/messages_page';

  static const String communityPage = '/community_page';

  static const String bidsScreen = '/bids_screen';

  static const String bidRequestScreen = '/bid_request_screen';

  static const String jobClientScreen = '/job_client_screen';

  static const String searchInfluncersScreen = '/search_influncers_screen';

  static const String searchResultsScreen = '/search_results_screen';

  static const String influencerProfileAboutPage =
      '/influencer_profile_about_page';

  static const String influencerProfileCommPostPage =
      '/influencer_profile_comm_post_page';

  static const String influencerProfileCommPostTabContainerScreen =
      '/influencer_profile_comm_post_tab_container_screen';

  static const String influencerProfileJobsPage =
      '/influencer_profile_jobs_page';

  static const String influencerProfileReviewPage =
      '/influencer_profile_review_page';

  static const String chatsOpenedScreen = '/chats_opened_screen';

  static const String chooseProfile = '/choose_profile';

  static const String editProfileListedJobsPage =
      '/edit_profile_listed_jobs_page';

  static const String editProfileListedJobsTabContainerScreen =
      '/edit_profile_listed_jobs_tab_container_screen';

  static const String editProfileListedJobsTabTwoContainerScreen =
      '/edit_profile_listed_jobs_tab_two_container_screen';

  static const String editProfileCommPostsPage =
      '/edit_profile_comm_posts_page';

  static const String transactionScreen =
      '/transaction_screen';

  static const String editProfileDetailsScreen = '/edit_profile_details_screen';

  static const String notificationMentionsScreen =
      '/notification_mentions_screen';

  static const String notificationBidsScreen = '/notification_bids_screen';

  static const String influencerTabScreen = '/influencer_tab_screen';

  static const String notificationLikedPostScreen =
      '/notification_liked_post_screen';

  static const String notificationPageClientScreen =
      '/notification_page_client_screen';

  static const String searchCreatorScreen = '/search_creator_screen';

  static const String creatorProfileListedJobsPage =
      '/creator_profile_listed_jobs_page';

  static const String creatorProfileCommPostsPage =
      '/creator_profile_comm_posts_page';

  static const String creatorProfileCommPostsTabContainerScreen =
      '/creator_profile_comm_posts_tab_container_screen';

  static const String creatorProfileReveiwsPage =
      '/creator_profile_reveiws_page';

  static const String influencerHomeScreen = '/influencer_home_screen';

  static const String creatorProfileReveiwsTabContainerScreen =
      '/creator_profile_reveiws_tab_container_screen';

  static const String jobDetailsScreen = '/job_details_screen';

  static const String jobHiredScreen = '/job_hired_screen';

  static const String reviewAcceptedScreen = '/review_accepted';

  static const String influencerJobTabScreen = '/influencer_job_tab_screen';

  static const String creatorJobDetailsScreen = '/creator_job_details_screen';

  static const String jobsMyBidsInfluencerPage =
      '/jobs_my_bids_influencer_page';

  static const String jobsMyBidsInfluencerTabContainerScreen =
      '/jobs_my_bids_influencer_tab_container_screen';

  static const String jobsJobsInfluencerPage = '/jobs_jobs_influencer_page';

  static const String jobsJobsInfluencerTabContainerScreen =
      '/jobs_jobs_influencer_tab_container_screen';

  static const String messagesPageInfluencerPage =
      '/messages_page_influencer_page';

  static const String jobsRequestsInfluencerPage =
      '/jobs_requests_influencer_page';

  static const String jobsRequestsInfluencerTabContainerScreen =
      '/jobs_requests_influencer_tab_container_screen';

  static const String communityInfluncerScreen = '/community_influncer_screen';

  static const String bidScreen = '/bid_screen';

  static const String editScreen = '/edit_screen';

  static const String completeJobScreen = '/complete_job_screen';

  static const String editProfileAboutPage = '/edit_profile_about_page';

  static const String editProfileCommPostPage = '/edit_profile_comm_post_page';

  static const String editProfileJobsPage = '/edit_profile_jobs_page';

  static const String editProfileDetailsOneScreen =
      '/edit_profile_details_one_screen';

  static const String chatsOpenedOneScreen = '/chats_opened_one_screen';

  static const String requestDetailScreen = '/request_detail_screen';

  static const String settingsScreen = '/settings_screen';

  static const String chargeScreen = '/charge_screen';

  static const String influencerHomeOneScreen = '/influencer_home_one_screen';

  static const String notificationMentionsOneScreen =
      '/notification_mentions_one_screen';

  static const String notificationRequestsScreen =
      '/notification_requests_screen';

  static const String notificationLikedPostOneScreen =
      '/notification_liked_post_one_screen';

  static const String notificationPageInfluencerScreen =
      '/notification_page_influencer_screen';

  static const String earningsScreen = '/earnings_screen';

  static const String requestAcceptedOneScreen = '/request_accepted_one_screen';

  static const String requestAcceptedScreen = '/request_accepted_screen';

  static const String jobAcceptedScreen = '/job_accepted_screen';

  static const String bidAcceptedScreen = '/bid_accepted_screen';

  static const String communityPostScreen = '/community_post_screen';

  static const String notificationFirestore = '/notification_firestore';

  static const String earningMenuTabScreen = '/earning_menu_tab_screen';

  static const String allHomePage = '/all_home_screen';

  static const String creatorAfterJobDetailsScreen = '/creator_after_job_details_screen';

  static const String fashionHomePage = '/fashion_home_screen';

  static const String technologyHomePage = '/technology_home_screen';

  static const String socialMediaHomePage = '/social_media_home_screen';

  static const String messagesPageOneScreen = '/messages_page_one_screen';

  static const String commentsOnCommunityScreen =
      '/comments_on_community_screen';

  static const String chatsScreen = '/chats_screen';

  static const String completPaymentScreen = '/complet_payment_screen';

  static const String paymentCardScreen = '/payment_card_screen';

  static const String paymentTransferScreen = '/payment_transfer_screen';

  static const String disputeScreen = '/dispute_screen';

  static const String withdrawalScreen = '/withdrawal_screen';

  static const String withdrawalTransactionScreen = '/withdrawal_transaction_screen';

  static const String withdrawalSuccessfulScreen =
      '/withdrawal_successful_screen';

  static const String paymentSuccesfulScreen = '/payment_succesful_screen';

  static const String paymentFailedScreen = '/payment_failed_screen';

  static const String withdrawlFailedScreen = '/withdrawl_failed_screen';

  static const String disputeSentScreen = '/dispute_sent_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: homeCreatorContainerScreen,
      page: () => HomeCreatorContainerScreen(),
      bindings: [
        HomeCreatorContainerBinding(),
      ],
    ),
    GetPage(
      name: homeCreatorContainerScreen,
      page: () => HomeCreatorContainerScreen(),
      bindings: [
        HomeCreatorContainerBinding(),
      ],
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: onboardingScreenOneScreen,
      page: () => OnboardingScreenOneScreen(),
      bindings: [
        OnboardingScreenOneBinding(),
      ],
    ),
    GetPage(
      name: onboardingScreenTwoScreen,
      page: () => OnboardingScreenTwoScreen(),
      bindings: [
        OnboardingScreenTwoBinding(),
      ],
    ),

    GetPage(
      name: settingsScreen,
      page: () => SettingsScreen(),
      bindings: [
        SettingsBinding(),
      ],
    ),

    GetPage(
      name: bidAcceptedScreen,
      page: () => BidAcceptedScreen(),
      bindings: [
        BidAcceptedBinding(),
      ],
    ),
    GetPage(
      name: onboardingScreenThreeScreen,
      page: () => OnboardingScreenThreeScreen(),
      bindings: [
        OnboardingScreenThreeBinding(),
      ],
    ),
    GetPage(
      name: emailCodeScreen,
      page: () => EmailCodeScreen(),
      bindings: [
        EmailCodeBinding(),
      ],
    ),
    GetPage(
      name: emailForgetScreen,
      page: () => EmailForgetScreen(),
      bindings: [
        EmailCodeBinding(),
      ],
    ),
    GetPage(
      name: logInScreen,
      page: () => LogInScreen(),
      bindings: [
        LogInBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: phoneVerificationScreen,
      page: () => PhoneVerificationScreen(),
      bindings: [
        PhoneVerificationBinding(),
      ],
    ),
    GetPage(
      name: confirmCodeScreen,
      page: () => ConfirmCodeScreen(),
      bindings: [
        ConfirmCodeBinding(),
      ],
    ),
    GetPage(
      name: completeProfileCreatorScreen,
      page: () => CompleteProfileCreatorScreen(),
      bindings: [
        CompleteProfileCreatorBinding(),
      ],
    ),
    GetPage(
      name: completeProfileInfluencerScreen,
      page: () => CompleteProfileInfluencerScreen(),
      bindings: [
        CompleteProfileInfluencerBinding(),
      ],
    ),

    GetPage(
      name: notificationFirestore,
      page: () => NotificationFirestore(),
      bindings: [
        NotificationFirestoreBinding(),
      ],
    ),

    GetPage(
      name: earningMenuTabScreen,
      page: () =>  EarningMenuTabScreen(),
      bindings: [
        EarningTabBinding(),
      ],
    ),

    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: resetPasswordScreen,
      page: () => ResetPasswordScreen(),
      bindings: [
        ResetPasswordBinding(),
      ],
    ),
    GetPage(
      name: influencerTabScreen,
      page: () => InfluencerTabsScreen(),
      bindings: [
        InfluencerTabsBinding(),
      ],
    ),
    GetPage(
      name: bidsScreen,
      page: () => BidsScreen(),
      bindings: [
        BidsBinding(),
      ],
    ),
    GetPage(
      name: editScreen,
      page: () => EditBidScreen(),
      bindings: [
        EditBidBinding(),
      ],
    ),
    GetPage(
      name: completeJobScreen,
      page: () => CompleteJobScreen(),
      bindings: [
        CompleteJobBinding(),
      ],
    ),
    GetPage(
      name: bidRequestScreen,
      page: () => BidRequestScreen(),
      bindings: [
        BidRequestBinding(),
      ],
    ),
    GetPage(
      name: jobClientScreen,
      page: () => JobClientScreen(),
      bindings: [
        JobClientBinding(),
      ],
    ),
    GetPage(
      name: jobHiredScreen,
      page: () => JobHiredScreen(),
      bindings: [
        JobHiredBinding(),
      ],
    ),
    GetPage(
      name: influencerJobTabScreen,
      page: () =>   InfluencerJobTabScreen(),
      bindings: [
        InfluencerJobTabBinding(),
      ],
    ),
    GetPage(
      name: searchInfluncersScreen,
      page: () => SearchInfluncersScreen(),
      bindings: [
        SearchInfluncersBinding(),
      ],
    ),

    GetPage(
      name: reviewAcceptedScreen,
      page: () => ReviewAcceptedScreen(),
      bindings: [
        ReviewAcceptedBinding(),
      ],
    ),
    GetPage(
      name: jobAcceptedScreen,
      page: () => JobAcceptedScreen(),
      bindings: [
        JobAcceptedBinding(),
      ],
    ),
    GetPage(
      name: searchResultsScreen,
      page: () => SearchResultsScreen(),
      bindings: [
        SearchResultsBinding(),
      ],
    ),
    GetPage(
      name: influencerProfileCommPostTabContainerScreen,
      page: () => InfluencerProfileCommPostTabContainerScreen(),
      bindings: [
        InfluencerProfileCommPostTabContainerBinding(),
      ],
    ),
    GetPage(
      name: chatsOpenedScreen,
      page: () => ChatsOpenedScreen(
      chatData:  ChatData(
      id: 'id',
      creatorId: 'CreatorId',
      creatorUserId: 'CreatorUserId',
      influencerId: 'InfluencerId',
      influencerUserId: 'defaultInfluencerUserId',
      unreadByCreator: 0,
      unreadByInfluencer: 0,
      blockedByCreator: false,
      blockedByInfluencer: false,
      chatId: 'defaultChatId',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      messages: const [],
      influencerUser: UserModel(
        id: 'id',
        firstName: 'firstName', 
        lastName: 'lastName', 
        email: 'email', 
        password: 'password',
        termsAndConditionsAgreement: false,
        isNewUser: false,
        isSocial: false,
        verified: false,
        verifiedEmail: false,
        followers: 0,
        following: 0,
        views: 0, 
        userId: 'userId', 
        createdAt: '', 
        updatedAt: '',
        creatorId: 'creatorId', 
        influencerId: 'influencerId', 
        country: 'country', 
        dob: 'dob',
        phone: 'phone', 
        username: 'username',
         avatar: 'avatar', 
         cover: 'cover'),
      creatorUser: UserModel(
        id: 'id',
        firstName: 'firstName', 
        lastName: 'lastName', 
        email: 'email', 
        password: 'password',
        termsAndConditionsAgreement: false,
        isNewUser: false,
        isSocial: false,
        verified: false,
        verifiedEmail: false,
        followers: 0,
        following: 0,
        views: 0, 
        userId: 'userId', 
        createdAt: '', 
        updatedAt: '',
        creatorId: 'creatorId', 
        influencerId: 'influencerId', 
        country: 'country', 
        dob: 'dob',
        phone: 'phone', 
        username: 'username',
         avatar: 'avatar', 
         cover: 'cover'),
      
      ),

      ),
      bindings: [
        ChatsOpenedBinding()
      ],
    ),
    GetPage(
      name: chooseProfile,
      page: () => ChooseProfile(),
      binding: ChooseProfileBinding(),
    ),

    GetPage(
      name: editProfileListedJobsTabContainerScreen,
      page: () => EditProfileListedJobsTabContainerScreen(),
      bindings: [
        EditProfileListedJobsTabContainerBinding(),
      ],
    ),

    GetPage(
      name: editProfileListedJobsTabTwoContainerScreen,
      page: () => EditProfileListedJobsTabTwoContainerScreen(),
      bindings: [
        EditProfileListedJobsTabTwoContainerBinding(),
      ],
    ),
    GetPage(
      name: editProfileDetailsScreen,
      page: () => EditProfileDetailsScreen(),
      bindings: [
        EditProfileDetailsBinding(),
      ],
    ),
    GetPage(
      name: notificationMentionsScreen,
      page: () => NotificationMentionsScreen(),
      bindings: [
        NotificationMentionsBinding(),
      ],
    ),
    GetPage(
      name: notificationBidsScreen,
      page: () => NotificationBidsScreen(),
      bindings: [
        NotificationBidsBinding(),
      ],
    ),
    GetPage(
      name: notificationLikedPostScreen,
      page: () => NotificationLikedPostScreen(),
      bindings: [
        NotificationLikedPostBinding(),
      ],
    ),
    GetPage(
      name: notificationPageClientScreen,
      page: () => NotificationPageClientScreen(),
      bindings: [
        NotificationPageClientBinding(),
      ],
    ),
    GetPage(
      name: searchCreatorScreen,
      page: () => SearchCreatorScreen(),
      bindings: [
        SearchCreatorBinding(),
      ],
    ),
    GetPage(
      name: transactionScreen,
      page: () => TransactionScreen(),
      bindings: [
        TransactionBinding(),
      ],
    ),
    GetPage(
      name: creatorProfileCommPostsTabContainerScreen,
      page: () => CreatorProfileCommPostsTabContainerScreen(),
      bindings: [
        CreatorProfileCommPostsTabContainerBinding(),
      ],
    ),
    // GetPage(
    //   name: influencerHomeScreen,
    //   page: () => InfluencerHomeScreen(),
    //   bindings: [
    //     InfluencerHomeBinding(),
    //   ],
    // ),
    GetPage(
      name: creatorProfileReveiwsTabContainerScreen,
      page: () => CreatorProfileReveiwsTabContainerScreen(),
      bindings: [
        CreatorProfileReveiwsTabContainerBinding(),
      ],
    ),
    GetPage(
      name: jobDetailsScreen,
      page: () => JobDetailsScreen(),
      bindings: [
        JobDetailsBinding(),
      ],
    ),
    GetPage(
      name: creatorJobDetailsScreen,
      page: () => CreatorJobDetailsScreen(),
      bindings: [
        CreatorJobDetailsBinding(),
      ],
    ),
    GetPage(
      name: creatorAfterJobDetailsScreen,
      page: () => CreatorAfterJobDetailsScreen(),
      bindings: [
        CreatorAfterJobDetailsBinding(),
      ],
    ),
    // GetPage(
    //   name: jobsMyBidsInfluencerTabContainerScreen,
    //   page: () => JobsMyBidsInfluencerTabContainerScreen(),
    //   bindings: [
    //     JobsMyBidsInfluencerTabContainerBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: jobsJobsInfluencerTabContainerScreen,
    //   page: () => JobsJobsInfluencerTabContainerScreen(),
    //   bindings: [
    //     JobsJobsInfluencerTabContainerBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: jobsRequestsInfluencerTabContainerScreen,
    //   page: () => JobsRequestsInfluencerTabContainerScreen(),
    //   bindings: [
    //     JobsRequestsInfluencerTabContainerBinding(),
    //   ],
    // ),
    GetPage(
      name: communityInfluncerScreen,
      page: () => CommunityInfluncerScreen(),
      bindings: [
        CommunityInfluncerBinding(),
      ],
    ),
    GetPage(
      name: bidScreen,
      page: () => BidScreen(),
      bindings: [
        BidBinding(),
      ],
    ),
    GetPage(
      name: editProfileDetailsOneScreen,
      page: () => EditProfileDetailsOneScreen(),
      bindings: [
        EditProfileDetailsOneBinding(),
      ],
    ),

    GetPage(
      name: requestDetailScreen,
      page: () => RequestDetailScreen(),
      bindings: [
        RequestDetailBinding(),
      ],
    ),
    GetPage(
      name: chargeScreen,
      page: () => ChargeScreen(),
      bindings: [
        ChargeBinding(),
      ],
    ),
    GetPage(
      name: influencerHomeOneScreen,
      page: () => InfluencerHomeOneScreen(),
      bindings: [
        InfluencerHomeOneBinding(),
      ],
    ),
    GetPage(
      name: notificationMentionsOneScreen,
      page: () => NotificationMentionsOneScreen(),
      bindings: [
        NotificationMentionsOneBinding(),
      ],
    ),
    GetPage(
      name: notificationRequestsScreen,
      page: () => NotificationRequestsScreen(),
      bindings: [
        NotificationRequestsBinding(),
      ],
    ),
    GetPage(
      name: notificationLikedPostOneScreen,
      page: () => NotificationLikedPostOneScreen(),
      bindings: [
        NotificationLikedPostOneBinding(),
      ],
    ),
    GetPage(
      name: notificationPageInfluencerScreen,
      page: () => NotificationPageInfluencerScreen(),
      bindings: [
        NotificationPageInfluencerBinding(),
      ],
    ),
    GetPage(
      name: earningsScreen,
      page: () => EarningsScreen(),
      bindings: [
        EarningsBinding(),
      ],
    ),
    GetPage(
      name: requestAcceptedOneScreen,
      page: () => RequestAcceptedOneScreen(),
      bindings: [
        RequestAcceptedOneBinding(),
      ],
    ),
    GetPage(
      name: requestAcceptedScreen,
      page: () => RequestAcceptedScreen(),
      bindings: [
        RequestAcceptedBinding(),
      ],
    ),
    GetPage(
      name: communityPostScreen,
      page: () => CommunityPostScreen(),
      bindings: [
        CommunityPostBinding(),
      ],
    ),
    GetPage(
      name: commentsOnCommunityScreen,
      page: () => CommentsOnCommunityScreen(),
      bindings: [
        CommentsOnCommunityBinding(),
      ],
    ),
    GetPage(
      name: completPaymentScreen,
      page: () => CompletPaymentScreen(),
      bindings: [
        CompletPaymentBinding(),
      ],
    ),
    GetPage(
      name: paymentCardScreen,
      page: () => PaymentCardScreen(),
      bindings: [
        PaymentCardBinding(),
      ],
    ),
    GetPage(
      name: paymentTransferScreen,
      page: () => PaymentTransferScreen(),
      bindings: [
        PaymentTransferBinding(),
      ],
    ),
    GetPage(
      name: disputeScreen,
      page: () => DisputeScreen(),
      bindings: [
        DisputeBinding(),
      ],
    ),
    GetPage(
      name: withdrawalScreen,
      page : () => WithdrawalScreen(),
      bindings: [
        WithdrawalBinding(),
      ],
    ),
    GetPage(
      name: withdrawalTransactionScreen,
      page : () => WithdrawTransactionScreen(),
      bindings: [
        WithdrawTransactionBinding(),
      ],
    ),
    GetPage(
      name: withdrawalSuccessfulScreen,
      page: () => WithdrawalSuccessfulScreen(),
      bindings: [
        WithdrawalSuccessfulBinding(),
      ],
    ),
    GetPage(
      name: paymentSuccesfulScreen,
      page: () => PaymentSuccesfulScreen(),
      bindings: [
        PaymentSuccesfulBinding(),
      ],
    ),
    GetPage(
      name: paymentFailedScreen,
      page: () => PaymentFailedScreen(),
      bindings: [
        PaymentFailedBinding(),
      ],
    ),
    GetPage(
      name: withdrawlFailedScreen,
      page: () => WithdrawlFailedScreen(),
      bindings: [
        WithdrawlFailedBinding(),
      ],
    ),
    GetPage(
      name: disputeSentScreen,
      page: () => DisputeSentScreen(),
      bindings: [
        DisputeSentBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),

    /// GetPage(name: initialRoute, page: () => SplashScreen(), bindings: [
    // SplashBinding(),
    // ]),

   //  GetPage(
   //   name: initialRoute,
   //   page: () => AppNavigationScreen(),
   //   bindings: [
   //     AppNavigationBinding(),
   //    ],
   //  )
   GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
     ],
    )
  ];
}
