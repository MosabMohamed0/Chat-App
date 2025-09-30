class ChatUser {
  String id;
  String email;
  String date;
  String? name;
  String? phone;
  ChatUser({
    required this.id,
    required this.email,
    required this.date,
    this.name,
    this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'date': date,
      'name': name,
      'phone': phone,
    };
  }

  factory ChatUser.fromMap(Map<String, dynamic> map) {
    return ChatUser(
      id: map['id'] as String,
      email: map['email'] as String,
      date: map['date'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
    );
  }
}
