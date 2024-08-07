import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:zora/core/utils/api_endpoints.dart';
import 'package:zora/data/models/chat_model/chat_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/data/service/shared_preferences/shared_preference.dart';

class ChatRepo {
  static var client = http.Client();

  static getAllchat() async {
    List list = [];
    String getallchaturl = "${ApiEndPoints.baseUrl}${ApiEndPoints.getAllchat}";
    final token = await UserToken.getToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final response =
        await client.get(Uri.parse(getallchaturl), headers: headers);
    log("response body chat = ${response.body}");
    try {
      if (response.statusCode == 200) {
        final responsebody = jsonDecode(response.body);
        for (var chat in responsebody) {
          list.add(ChatModel.fromJson(chat));
        }
        return list;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static getchatwithUser(String userid) async {
    List<ChatModel> list = [];
     List<ChatModel> emptylist = [];
    final getachat = "${ApiEndPoints.baseUrl}${ApiEndPoints.getachat}$userid";
    final token = await UserToken.getToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final response = await client.get(Uri.parse(getachat), headers: headers);
    log("response body getChatwithuser = ${response.body}");
    try {
      if (response.statusCode == 200) {
        final responsedody = jsonDecode(response.body)['data'];
        for (var chat in responsedody) {
          list.add(ChatModel.fromJson(chat));
        }
        return list;
      }
      if (response.statusCode == 404) {
        return emptylist;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<List<UserModel>> getusersInChat() async {
    List<UserModel> userlist = [];
    String userchat = "${ApiEndPoints.baseUrl}${ApiEndPoints.getmychat}";
    String token = await UserToken.getToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final response = await client.get(Uri.parse(userchat), headers: headers);
    log("response body get users in chat = ${response.body}");
    final username = await getUsername();
    try {
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['data'];
        for (var chatData in data) {
          String senderUsername = chatData['sender']['username'];
          String receiverUsername = chatData['receiver']['username'];

          if (senderUsername != username &&
              !userlist.any((user) => user.username == senderUsername)) {
            userlist.add(UserModel.fromJson(chatData['sender']));
          }
          if (receiverUsername != username &&
              !userlist.any((user) => user.username == receiverUsername)) {
            userlist.add(UserModel.fromJson(chatData['receiver']));
          }
        }
        return userlist;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static getAllChatwithMe() async {
    List messages = [];
    String token = await UserToken.getToken();
    String allchaturl = "${ApiEndPoints.baseUrl}${ApiEndPoints.getmychat}";
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final response = await client.get(Uri.parse(allchaturl), headers: headers);
    log("get all chat with me response body = ${response.body}");
    try {
      if (response.statusCode == 200) {
        final responsebody = jsonDecode(response.body)['data'];
        for (var chat in responsebody) {
          messages.add(ChatModel.fromJson(chat));
        }
        return messages;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
