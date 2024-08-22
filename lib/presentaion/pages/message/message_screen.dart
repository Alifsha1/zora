import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/bloc/all_chat_with_me/all_chat_with_me_bloc.dart';
import 'package:zora/presentaion/bloc/message_list/message_list_bloc.dart';
import 'package:zora/presentaion/pages/message/widgets/messages_view_list.dart';

class MessageScreenList extends StatefulWidget {
  const MessageScreenList({super.key});

  @override
  State<MessageScreenList> createState() => _MessageScreenListState();
}

class _MessageScreenListState extends State<MessageScreenList> {
  @override
  void initState() {
    context.read<MessageListBloc>().add(GetUsersFromChat());
    context.read<AllChatWithMeBloc>().add(GetAllChatWithMeEvent());
    super.initState();
  }
 Future<void> refreshmessageList() async {
    await Future.delayed(const Duration(seconds: 2));
    context.read<MessageListBloc>().add(GetUsersFromChat());
    context.read<AllChatWithMeBloc>().add(GetAllChatWithMeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(

      onRefresh: refreshmessageList,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: maincolor,
          title: NormalBondTitles(
            titles: 'Messages',
            color: kblack,
          ),
        ),
        body: Messagesviewlist(),
      ),
    );
  }
}
