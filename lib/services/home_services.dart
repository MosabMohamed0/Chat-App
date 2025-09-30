import 'package:chat_app/models/chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Stream<List<ChatUser>> getAllUsers() {
    return _db
        .collection('users')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => ChatUser.fromMap(doc.data())).toList(),
        );
  }
}
