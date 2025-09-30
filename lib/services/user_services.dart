import 'package:chat_app/models/chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServices {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static Future<void> addNewUser(ChatUser user) async {
    await _db.collection('users').doc(user.id).set(user.toMap());
  }

  static Future<String> getUserCurrentId() async {
    return FirebaseAuth.instance.currentUser!.uid;
  }
}
