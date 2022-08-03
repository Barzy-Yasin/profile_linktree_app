 // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// class CommentersModel {
//   final int id;
//   final String name;
//   final String message;

//   CommentersModel(
//       {required this.id, required this.name, required this.message});

//   factory CommentersModel.fromMap(Map<String, dynamic> map) {
//     return CommentersModel(
//       id: map["id"],
//       name: map["name"],
//       message: map["message"],
//     );
//   }
// }


class CommentersModel {
  final int id;
  final String name;
  final String message;
  CommentersModel({
    required this.id,
    required this.name,
    required this.message,
  });

  CommentersModel copyWith({
    int? id,
    String? name,
    String? message,
  }) {
    return CommentersModel(
      id: id ?? this.id,
      name: name ?? this.name,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'message': message,
    };
  }

  factory CommentersModel.fromMap(Map<String, dynamic> map) {
    return CommentersModel(
      id: map['id'] as int,
      name: map['name'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentersModel.fromJson(String source) => CommentersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CommentersModel(id: $id, name: $name, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CommentersModel &&
      other.id == id &&
      other.name == name &&
      other.message == message;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ message.hashCode;
}
