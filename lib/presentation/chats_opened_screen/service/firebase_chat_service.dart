import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseChatService {
  final CollectionReference _messagesCollection =
  FirebaseFirestore.instance.collection('messages');

  Future<void> sendMessage(String message, String senderId) async {
    try {
      await _messagesCollection.add({
        'text': message,
        'senderId': senderId,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  Stream<QuerySnapshot> getMessages() {
    return _messagesCollection.orderBy('timestamp').snapshots();
  }
}
