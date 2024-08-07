// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:zora/core/style/colors/colors.dart';
// import 'package:zora/presentaion/pages/message/chat/chat_bottom.dart';
// import 'package:zora/presentaion/pages/message/chat/own_message_field.dart';
// import 'package:zora/presentaion/pages/message/chat/reply_message_field.dart';

// class UserChatPage extends StatefulWidget {
//   const UserChatPage({super.key});

//   @override
//   State<UserChatPage> createState() => _UserChatPageState();
// }

// class _UserChatPageState extends State<UserChatPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Expanded(
//               child: Align(
//             alignment: Alignment.bottomCenter,
//             child: ListView.builder(
//               reverse: true,
//               shrinkWrap: true,
//               padding: EdgeInsets.all(8),
//               physics: ClampingScrollPhysics(),
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 if (index % 2 == 0) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         child: Text(
//                           '',
//                           style: TextStyle(
//                             fontSize: 13,
//                             color: Theme.of(context).colorScheme.secondary,
//                           ),
//                         ),
//                       ),
//                       OwnMessageCard(),
//                       //  ReplyCard()
//                     ],
//                   );
//                 } else {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         child: Text(
//                           '',
//                           style: TextStyle(
//                             fontSize: 13,
//                             color: Theme.of(context).colorScheme.secondary,
//                           ),
//                         ),
//                       ),
//                       // OwnMessageCard(),
//                       ReplyCard()
//                     ],
//                   );
//                 }
//               },
//             ),
//           )),
//           ChatBottomWidget(),
//          // emojiWidget(),
//         ],
//       ),
//     );
//   }

//   Widget emojiWidget() {
//     return EmojiPicker(
//       config: Config(
//         categoryViewConfig: CategoryViewConfig(
//           tabBarHeight: 40,
//           tabIndicatorAnimDuration: const Duration(milliseconds: 500),
//           backgroundColor: Theme.of(context).colorScheme.primaryContainer,
//         ),
//         bottomActionBarConfig: const BottomActionBarConfig(
//           showBackspaceButton: false,
//           showSearchViewButton: false,
//         ),
//         emojiViewConfig: EmojiViewConfig(
//           columns: 8,
//           emojiSizeMax: 25,
//           backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
//           noRecents: Text(
//             'No Recents',
//             style: TextStyle(
//               fontSize: 16,
//               color: Theme.of(context).colorScheme.onSecondary,
//             ),
//           ),
//         ),
//       ),
//       onEmojiSelected: (category, emoji) {
//         setState(() {
//           // messageController.text = messageController.text + emoji.emoji;
//           // sendButton = true;
//         });
//       },
//     );
//   }
// }
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/chat_model/chat_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/bloc/chat_/chat_bloc.dart';
import 'package:zora/presentaion/bloc/profile_of_users_bloc/profile_bloc.dart';
import 'package:zora/presentaion/pages/message/chat/chat_bottom.dart';
import 'package:zora/presentaion/pages/message/chat/loading/chat_loading.dart';
import 'package:zora/presentaion/pages/message/chat/own_message_field.dart';
import 'package:zora/presentaion/pages/message/chat/reply_message_field.dart';

class UserChatPage extends StatefulWidget {
  final UserModel user;

  const UserChatPage({super.key, required this.user});

  @override
  State<UserChatPage> createState() => _UserChatPageState();
}

class _UserChatPageState extends State<UserChatPage> {
  TextEditingController messagecontroller = TextEditingController();
  @override
  void initState() {
    context.read<ProfileBloc>().add(ProfileInitialFetchEvent());
    context.read<ChatBloc>().add(ChatWithUserEvent(userid: widget.user.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: NormalBondTitles(titles: widget.user.fullName!),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Builder(
          builder: (context) {
            final stateA = context.watch<ProfileBloc>().state;
            final stateB = context.watch<ChatBloc>().state;
            if (stateA is ProfileFetchingSuccessState) {
              if (stateB is ChatLoadingState) {}
              if (stateB is GetChatSuccessfullState) {
                List<DateTime> dates = [];
                List<List<ChatModel>> messagebyDate = [];

                if (stateB.chat.isEmpty) {
                  return Stack(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 170,
                      child: Center(
                        child: Text(
                          "It's time to start a chat!!",
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: ChatBottomWidget(
                          currentuserid: stateA.userDetails.id!,
                          currentusername: stateA.userDetails.username!,
                          recieverid: widget.user.id!,
                          recievername: widget.user.username!,
                        )),
                  ]);
                } else {
                  for (ChatModel message in stateB.chat) {
                  //  DateTime createdAt = message.sendAt;
                    DateTime date = DateTime(message.sendAt.year,
                        message.sendAt.month, message.sendAt.day);
                    if (!dates.contains(date)) {
                      dates.add(date);
                      messagebyDate.add([message]);
                    } else {
                      messagebyDate.last.add(message);
                    }
                  }

                  return Stack(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 170,
                      child: ListView.builder(
                        itemCount: dates.length,
                        reverse: true,
                        // shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final reversedindex = dates.length - 1 - index;
                          return Column(
                            children: [
                              DateDivider(date: dates[reversedindex]),
                              ...messagebyDate[reversedindex].map((e) {
                                if (e.sender.id == stateA.userDetails.id) {
                                  return OwnMessageCard(
                                    message: e,
                                  );
                                } else {
                                  return ReplyCard(
                                    message: e,
                                  );
                                }
                              })
                            ],
                          );
                        },
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: ChatBottomWidget(
                          currentuserid: stateA.userDetails.id!,
                          currentusername: stateA.userDetails.username!,
                          recieverid: widget.user.id!,
                          recievername: widget.user.username!,
                        )),
                  ]);
                }
              }
            }
            return const ChatLoading();
          },
        ),
      ),
    );
    //   }
    // }
  }
  //  );
}

bool _hasMessages(
    String currentUser, String otherUser, List<ChatModel> messages) {
  return messages.any((message) =>
      (message.sender.username == currentUser &&
          message.receiver.username == otherUser) ||
      (message.receiver.username == currentUser &&
          message.sender.username == otherUser));
}

Widget emojiselect() {
  return EmojiPicker(
      config: const Config(
        height: 100,
        checkPlatformCompatibility: true,
        emojiViewConfig: EmojiViewConfig(
          emojiSizeMax: 25,
        ),
        swapCategoryAndBottomBar: false,
        skinToneConfig: SkinToneConfig(),
        categoryViewConfig: CategoryViewConfig(),
        bottomActionBarConfig: BottomActionBarConfig(),
        searchViewConfig: SearchViewConfig(),
      ),
      onEmojiSelected: (category, emoji) {});
}
