import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minimal_chat_app/models/message.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';

class ChatService {
  // get instance of firestore & auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _authService = AuthService();

  // get user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  // send message
  Future<void> sendMessage(String recieverID, String message) async {
    // get current user data
    final String currentUserID = _authService.getCurrentUser()!.uid;
    final String currentUserEmail = _authService.getCurrentUser()!.email!;
    final Timestamp timestamp = Timestamp.now();

    // create new message
    Message newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      recieverID: recieverID,
      message: message,
      timestamp: timestamp,
    );

    // construct chat room ID for the two users ( sorted for uniqueness )
    List<String> ids = [currentUserID, recieverID];
    ids.sort();
    String roomID = ids.join('_');

    // add new message to database
    await _firestore
        .collection('chat_rooms')
        .doc(roomID)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // get messages
  Future<Stream<QuerySnapshot<Object?>>> getMessages(
    String userID,
    String recieverID,
  ) async {
    List<String> ids = [userID, recieverID];
    ids.sort();
    String roomID = ids.join('_');

    return _firestore
        .collection('chat_rooms')
        .doc(roomID)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
