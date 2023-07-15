/// This class defines the variables used in the [log_in_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class LogInModel {
  String email;
  String password;

  LogInModel({required this.email,required this.password });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
