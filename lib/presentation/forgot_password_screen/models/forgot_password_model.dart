/// This class defines the variables used in the [forgot_password_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ForgotPasswordModel {
   String email;
  // String? password;

  ForgotPasswordModel({required this.email  //this.password
  });


 Map<String, dynamic> toJson() {
    return {
      'email': email,
    //  'password': password,
    };
  }
 }
