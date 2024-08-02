import 'package:flutter/material.dart';
import 'package:zora/core/style/colors/colors.dart';

class ExpandCommentWidget extends StatefulWidget {
  final String comment;
  final double width;
  const ExpandCommentWidget(
      {super.key, required this.comment, required this.width});

  @override
  State<ExpandCommentWidget> createState() => _ExpandCommentWidgetState();
}

class _ExpandCommentWidgetState extends State<ExpandCommentWidget> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          expand = !expand;
        });
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          //bottom: 10,
        ),
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(38),
            bottomRight: Radius.circular(38),
          ),
          color: expand ? kwhite : null,
        ),
        height: expand ? 200 : 30,
        duration: const Duration(milliseconds: 200),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                expand
                    ? Text(
                        widget.comment.trim(),
                        style: TextStyle(
                          color: kblack,
                          fontSize: 15,
                          //  fontWeight: FontWeight.bold,
                        ),
                      )
                    : RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: widget.comment.length > 8
                                  ? widget.comment.substring(0, 8)
                                  : widget.comment,
                              style: TextStyle(
                                color: kblack,
                                fontSize: 15,
                                //  fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (widget.comment.length > 8)
                              const TextSpan(
                                text: '...more',
                                style: TextStyle(
                                  color: kgrey,
                                  fontSize: 15,
                                  //  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
