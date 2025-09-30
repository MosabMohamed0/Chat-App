import 'package:chat_app/models/messsage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // إرسال رسالة
  static Future<void> sendMessage(Message message) async {
    final participants = message.participants..sort();
    final chatRoomId = participants.join('_');

    await _db
        .collection('chats')
        .doc(chatRoomId)
        .collection('messages')
        .doc(message.id)
        .set(message.toMap());
  }

  // ✅ جلب الرسائل بدون مشاكل Index
  static Stream<List<Message>> getMessages(String senderId, String receiverId) {
    final participants = [senderId, receiverId]..sort();

    // ✅ استخدام chatRoomId بدلاً من participants array
    final chatRoomId = participants.join('_');

    return _db
        .collection('chats')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('date', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Message.fromMap(doc.data())).toList(),
        );
  }
}
