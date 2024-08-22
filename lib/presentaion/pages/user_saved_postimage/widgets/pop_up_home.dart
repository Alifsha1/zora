import 'package:flutter/material.dart';
import 'package:zora/core/style/colors/colors.dart';

// ignore: must_be_immutable
class PopUpHomeWidget extends StatefulWidget {
  void Function()? onTap1;
   
  final String buttontxt;

  PopUpHomeWidget({
    super.key,
    required this.onTap1,required this.buttontxt,
    
  });

  @override
  State<PopUpHomeWidget> createState() => _PopUpHomeWidgetState();
}

class _PopUpHomeWidgetState extends State<PopUpHomeWidget> {
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
                      style: const TextStyle(color: kwhite),
                    ),
                  ),
                  
                ];
              });
        }));
  }
}
