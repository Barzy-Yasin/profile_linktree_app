// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatModel {
  String name;
  String message;
  String url;
  ChatModel({
    required this.name,
    required this.message,
    required this.url,
  });

  ChatModel copyWith({
    String? name,
    String? message,
    String? url,
  }) {
    return ChatModel(
      name: name ?? this.name,
      message: message ?? this.message,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'message': message,
      'url': url,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      name: map['name'] as String,
      message: map['message'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) => ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ChatModel(name: $name, message: $message, url: $url)';

  @override
  bool operator ==(covariant ChatModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.message == message &&
      other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ message.hashCode ^ url.hashCode;
}
