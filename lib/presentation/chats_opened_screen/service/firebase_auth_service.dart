import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signInWithJwtToken(String jwtToken) async {
    try {
      UserCredential userCredential =
      await _auth.signInWithCustomToken(jwtToken);
      return userCredential.user?.uid;
    } catch (e) {
      print('Error signing in with JWT token: $e');
      return null;
    }
  }
}
