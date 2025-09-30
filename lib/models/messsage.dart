import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String id;
  String text;
  Timestamp date;
  String senderId;
  String receiverId;
  List<String> participants; 

  Message({
    required this.id,
    required this.text,
    required this.date,
    required this.senderId,
    required this.receiverId,
    required this.participants,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'date': date,
      'senderId': senderId,
      'receiverId': receiverId,
      'participants': participants,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] as String,
      text: map['text'] as String,
      date: map['date'] as Timestamp,
      senderId: map['senderId'] as String,
      receiverId: map['receiverId'] as String,
      participants: List<String>.from(map['participants'] ?? []),
    );
  }
}
