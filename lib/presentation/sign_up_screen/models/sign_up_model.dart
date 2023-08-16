/// This class defines the variables used in the [sign_up_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SignUpModel {
   String firstName;
   String lastName;
   String email;
   String password;
   String country;
   bool termsAndConditions;

   SignUpModel({required this.firstName, required this.lastName, required this.email, required this.password,required this.country, required this.termsAndConditions});

   Map<String, dynamic> toJson() {
      return {
         'firstName': firstName,
         'lastName': lastName,
         'email': email,
         'password': password,
         'country':country,
         'termsAndConditionsAgreement': termsAndConditions,
      };
   }
}
