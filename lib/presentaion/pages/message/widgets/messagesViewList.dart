import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/bloc/all_chat_with_me/all_chat_with_me_bloc.dart';
import 'package:zora/presentaion/bloc/message_list/message_list_bloc.dart';
import 'package:zora/presentaion/pages/message/widgets/loading/message_list_loading.dart';
import 'package:zora/presentaion/pages/message/widgets/message_user_listtile.dart';


class Messagesviewlist extends StatefulWidget {
  const Messagesviewlist({super.key});

  @override
  State<Messagesviewlist> createState() => _MessagesviewlistState();
}

class _MessagesviewlistState extends State<Messagesviewlist> {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final stateA = context.watch<MessageListBloc>().state;
      final stateB = context.watch<AllChatWithMeBloc>().state;
      if (stateA is UserListFromChatSuccessfullState) {
        return stateA.userlist.isNotEmpty
            ? ListView.builder(
                itemCount: stateA.userlist.length,
                controller: scrollController,
                itemBuilder: (context, index) {
                  if (stateB is GetAllChatWithMeSucceccfullState) {
                    final user = stateA.userlist[index];
                    //  final lastMessage =
                    //  final DateTime finalDate = DateTime.parse(formattedString)
                    return GestureDetector(
                        onTap: () {
                          //  navigatorPush(UserChatPage(user: user,), context);
                        },
                        child: MessageUserListtile(
                          user: user,
                          fullname: stateA.userlist[index].fullName!,
                          profile: stateA.userlist[index].profilePicture!,
                        ));
                  }
                  return null;
                },
              )
            : const Center(
                child: NormalBondTitles(
                  titles: 'No conversations',
                  color: kblack,
                ),
              );
      } else {
        return ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const MessageListLoading();
          },
        );
      }
    });
  }
}
