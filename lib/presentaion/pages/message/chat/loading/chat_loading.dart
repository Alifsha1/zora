import 'package:flutter/material.dart';
import 'package:zora/presentaion/pages/message/chat/chat_bottom.dart';
import 'package:zora/presentaion/pages/message/chat/loading/own_cardloading.dart';
import 'package:zora/presentaion/pages/message/chat/loading/reply_card_loading.dart';

class ChatLoading extends StatefulWidget {
  const ChatLoading({super.key});

  @override
  State<ChatLoading> createState() => _ChatLoadingState();
}

class _ChatLoadingState extends State<ChatLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Builder(
          builder: (context) {
            return Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height - 140,
                child: ListView.builder(
                  itemCount: 10,
                  reverse: true,
                  // shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const Column(
                      children: [
                       OwnCardloading(),
                        ReplyCardLoading(),
                         OwnCardloading(),
                        ReplyCardLoading(),
                         OwnCardloading(),
                        ReplyCardLoading(),
                         OwnCardloading(),
                        ReplyCardLoading(),
                         OwnCardloading(),
                        ReplyCardLoading(),
                         OwnCardloading(),
                        ReplyCardLoading(),
                       
                      ],
                    );
                  },
                ),
              ),
              const Align(
                  alignment: Alignment.bottomCenter,
                  child: ChatBottomWidget(
                    currentuserid: '',
                    currentusername: '',
                    recieverid: '',
                    recievername: '',
                  )),
            ]);
          },
        ),
      ),
    );
    //   }
    // }
  }
}
