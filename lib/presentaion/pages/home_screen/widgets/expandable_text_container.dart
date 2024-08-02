import 'package:flutter/material.dart';
import 'package:zora/core/style/colors/colors.dart';

class ExpandableTextContainer extends StatefulWidget {
  final String description;
  final double width;
  final Color textcolor;
  final Color boxcolor;

  const ExpandableTextContainer(
      {Key? key,
      required this.description,
      required this.width,
      required this.textcolor,
      required this.boxcolor})
      : super(key: key);

  @override
  _ExpandableTextContainerState createState() =>
      _ExpandableTextContainerState();
}

class _ExpandableTextContainerState extends State<ExpandableTextContainer> {
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
          color: expand ? widget.boxcolor : null,
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
                        widget.description.trim(),
                        style: TextStyle(
                          color: widget.textcolor,
                          fontSize: 20,
                          //fontWeight: FontWeight.bold,
                        ),
                      )
                    : RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: widget.description.length > 8
                                  ? widget.description.substring(0, 8)
                                  : widget.description,
                              style: TextStyle(
                                color: widget.textcolor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (widget.description.length > 8)
                              const TextSpan(
                                text: '...more',
                                style: TextStyle(
                                  color: kgrey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
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
