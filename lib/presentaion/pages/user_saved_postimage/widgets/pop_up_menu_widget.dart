import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zora/core/style/colors/colors.dart';

// ignore: must_be_immutable
class PopUpMenuWidgetButton extends StatefulWidget {
  void Function()? onTap1;
   void Function()? onTap2;
  final String buttontxt;
  final String? txt2;
  PopUpMenuWidgetButton({
    super.key,
    required this.onTap1,required this.buttontxt, this.txt2,
    this.onTap2,
  });

  @override
  State<PopUpMenuWidgetButton> createState() => _PopUpMenuWidgetButtonState();
}

class _PopUpMenuWidgetButtonState extends State<PopUpMenuWidgetButton> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 23,
        backgroundColor: Colors.transparent.withOpacity(.5),
        child: Builder(builder: (BuildContext context) {
          return PopupMenuButton<String>(
              icon: const Icon(
                Icons.more_vert,
                color: kwhite,
              ),
              color: Colors.transparent.withOpacity(0.5),
              onSelected: (String value) {},
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    onTap: widget.onTap1,
                    value: widget.buttontxt,
                    child:  Text(
                      widget.buttontxt,
                      style: TextStyle(color: kwhite),
                    ),
                  ),
                  
                  PopupMenuItem(
                    onTap: widget.onTap2,
                    value: widget.txt2,
                    child:  Text(
                      widget.txt2?? '',
                      style: TextStyle(color: kwhite),
                    ),
                  ),
                ];
              });
        }));
  }
}
