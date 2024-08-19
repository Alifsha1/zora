
import 'package:zora/data/models/user_model/user_model.dart';

class ChatModel {
  final String message;
  final UserModel sender;
  final UserModel receiver;
  final DateTime sendAt;

  ChatModel({
    required this.message,
    required this.sender,
    required this.receiver,
    required this.sendAt,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      message: json['message'],
      sender: UserModel.fromJson(json['sender']),
      receiver: UserModel.fromJson(json['receiver']),
      sendAt: DateTime.parse(json['createdAt']),
    );
  }
}

// import 'package:zora/data/models/user_model/user_model.dart';

// class ChatModel {
//   final String id;
//   final UserModel sender;
//   final UserModel receiver;
//   final String message;
//   final String createdAt;
//   final String updatedAt;

//   ChatModel({
//     required this.id,
//     required this.sender,
//     required this.receiver,
//     required this.message,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory ChatModel.fromJson(Map<String, dynamic> json) {
//     return ChatModel(
//       id: json['_id'],
//       sender: UserModel.fromJson(json['sender']),
//       receiver: UserModel.fromJson(json['receiver']),
//       message: json['message'],
//       createdAt: json['createdAt'],
//       updatedAt: json['updatedAt'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'sender': sender.toJson(),
//       'receiver': receiver.toJson(),
//       'message': message,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//     };
//   }
// }

class LastMessageModel {
  final String lastMessage;
  final String lastmessageTime;

  LastMessageModel({required this.lastMessage, required this.lastmessageTime});
}