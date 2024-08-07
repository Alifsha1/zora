import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/chat_model/chat_model.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({
    super.key,
    required this.message,
  });

  final ChatModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 110,
            ),
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              color: kwhite,
              //boxShadow: kBoxShadow,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
             message.message,
              style: const TextStyle(color: kblack),
            ),
          ),
         // kWidth(8),
         kwidht10,
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              '',
             // DateFormat('h:mm:a').format(message.sendAt.toLocal()),
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class DateDivider extends StatelessWidget {
  final DateTime date;

  const DateDivider({required this.date, super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isToday = date.year == now.year && date.month == now.month && date.day == now.day;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        isToday? 'Today' : DateFormat.yMMMd().format(date),
        style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold,),
     ),
);
}
}
