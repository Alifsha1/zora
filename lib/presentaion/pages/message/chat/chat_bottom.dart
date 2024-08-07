import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:zora/core/icons/customiconsflutter_icons.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/service/socket/socket_io.dart';

class ChatBottomWidget extends StatefulWidget {
  final String currentusername;
  final String currentuserid;
  final String recievername;
  final String recieverid;
  const ChatBottomWidget(
      {super.key,
      required this.currentusername,
      required this.currentuserid,
      required this.recievername,
      required this.recieverid});

  @override
  State<ChatBottomWidget> createState() => _ChatBottomWidgetState();
}

class _ChatBottomWidgetState extends State<ChatBottomWidget> {
  //   TextEditingController messagecontroller = TextEditingController();
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController messagecontroller = TextEditingController();
  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          focusNode.unfocus();
                          focusNode.canRequestFocus = false;
                          setState(() {
                            show = !show;
                          });
                        },
                        icon: Icon(
                          Icons.emoji_emotions,
                          color: kblue,
                        )),
                    Expanded(
                        child: TextField(
                      controller: messagecontroller,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                          hintText: 'Type Something...',
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: SizedBox(
                        width: 60,
                        height: 30,
                        child: MaterialButton(
                          // padding: EdgeInsets.only(right: 1, left: 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: kblue,
                          onPressed: () {
                            SocketIo().sendMessage(
                                loginUsername: widget.currentusername,
                                loginedUserid: widget.currentuserid,
                                recieverid: widget.recieverid,
                                recievername: widget.recievername,
                                message: messagecontroller.text);
                            messagecontroller.clear();
                          },
                          child: Icon(
                            TablerIcons.send,
                            color: kwhite,
                          ),
                        ),
                      ),
                    )
                    //  IconButton(onPressed: (){}, icon: Icon(Icons.image,color: kblue,)),
                  ],
                ),
              ),
            ),
          ],
        ),
        show ? emojiselect() : const SizedBox(),
      ],
    );
  }

  Widget emojiselect() {
    return EmojiPicker(
        config: Config(
          height: 256,
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
        onEmojiSelected: (category, emoji) {
          setState(() {
            messagecontroller.text = messagecontroller.text + emoji.emoji;
          });
        });
  }

  // Widget emojiWidget() {
  //   return EmojiPicker(
  //     config: Config(
  //       categoryViewConfig: CategoryViewConfig(
  //         tabBarHeight: 40,
  //         tabIndicatorAnimDuration: const Duration(milliseconds: 500),
  //         backgroundColor: Theme.of(context).colorScheme.primaryContainer,
  //       ),
  //       bottomActionBarConfig: const BottomActionBarConfig(
  //         showBackspaceButton: false,
  //         showSearchViewButton: false,
  //       ),
  //       emojiViewConfig: EmojiViewConfig(
  //         columns: 8,
  //         emojiSizeMax: 25,
  //         backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
  //         noRecents: Text(
  //           'No Recents',
  //           style: TextStyle(
  //             fontSize: 16,
  //             color: Theme.of(context).colorScheme.onSecondary,
  //           ),
  //         ),
  //       ),
  //     ),
  //     onEmojiSelected: (category, emoji) {
  //       setState(() {
  //         // messageController.text = messageController.text + emoji.emoji;
  //         // sendButton = true;
  //       });
  //     },
  //   );
  // }
}
