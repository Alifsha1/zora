import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:zora/core/utils/api_endpoints.dart';
import 'package:zora/data/models/chat_model/chat_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/data/service/shared_preferences/shared_preference.dart';
import 'package:zora/presentaion/bloc/chat_/chat_bloc.dart';

class SocketIo {
  IO.Socket socket = IO.io(ApiEndPoints.baseUrl, <String, dynamic>{
    'transports': ['websocket'],
    "autoConnect": true,
  });

  void connectSocket(BuildContext builcontext) async {
    final username = await getUsername();
    if (socket.disconnected) {
      socket.connect();
    }
    //socket.connect();
    socket.onConnect((data) {
      log('Socket Connected');
    });
    socket.off("message");
    socket.on("message", (data) {
      log('socket.on working ');
      try {} catch (e) {
        log(e.toString());
      }

      final chat = ChatModel(
          message: data['message'],
          sender: UserModel(
              username: data['sender']['username'], id: data['sender']['_id']),
          receiver: UserModel(
              username: data['receiver']['username'],
              id: data['receiver']['_id']),
          sendAt: data['sender']);
      builcontext.read<ChatBloc>().add(AddReceiverChatEvent(chat: chat));
    });

    socket.onConnectError((data) => debugPrint('connect error :$data'));
    socket.onDisconnect((data) => debugPrint('Socket.Io server disconnected'));
    socket.emit("newUser", username);
  }

  sendMessage(
      {required String loginUsername,
      required String loginedUserid,
      required String recieverid,
      required String recievername,
      required String message}) {
    final body = {
      "message": message,
      "sender": {"username": loginUsername, "_id": loginedUserid},
      "receiver": {"username": recievername, "_id": recieverid}
    };
    socket.emit("message", jsonEncode(body));
  }

  disconnectSocket() {
    socket.disconnect();
    socket.clearListeners();
  }
}
