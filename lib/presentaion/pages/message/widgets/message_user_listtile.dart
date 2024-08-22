
import 'package:flutter/material.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/core/utils/format_time_date.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/pages/message/chat/user_chat_page.dart';

class MessageUserListtile extends StatefulWidget {
  final UserModel user;
  final String fullname;
  final String? profile;
  final String? lastmsg;
  final String? time;
  const MessageUserListtile(
      {super.key,
      required this.fullname,
      this.profile,
      required this.user,
      this.lastmsg,
      this.time});

  @override
  State<MessageUserListtile> createState() => _MessageUserListtileState();
}

class _MessageUserListtileState extends State<MessageUserListtile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // navigatorPush(UserChatPage(), context);
        navigatorPush(
            UserChatPage(
              user: widget.user,
            ),
            context);
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: widget.profile == null || widget.profile!.isEmpty
              ? const AssetImage('assets/images/placeholdercover.jpg')
              : NetworkImage(widget.profile!) as ImageProvider,
        ),
        title: Text(
          widget.fullname,
          style: const TextStyle(
            fontSize: 15,
            height: 1.5,
          ),
          maxLines: 1,
        ),
        minVerticalPadding: 18,
        subtitle: Text(
          widget.lastmsg!,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).colorScheme.secondary,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(formatTimeAgo(widget.time!)),
      ),
    );
  }
}
