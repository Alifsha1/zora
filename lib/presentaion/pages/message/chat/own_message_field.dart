import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/chat_model/chat_model.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({
    super.key,
     required this.message,
  });

   final ChatModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              '',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 11,
              ),
            ),
          ),
          //kWidth(8),
          kwidht10,
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 110,
            ),
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              // color: Theme.of(context).colorScheme.onPrimary,
              color: kblue,
              //  boxShadow: kBoxShadow,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              message.message,
              style: const TextStyle(color: kwhite),
            ),
          ),
        ],
      ),
    );
  }
}

