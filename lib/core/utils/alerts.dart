import 'package:flutter/material.dart';

customSnackbar(BuildContext context, String message,Color color,
    {IconData? leading, String? trailing}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      backgroundColor: color,
      dismissDirection: DismissDirection.up,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          // if (leading != null)
          //   Icon(
          //     leading,
          //     color: lWhite,
          //   ),
          // kWidth(10),
          SizedBox(
            width: MediaQuery.of(context).size.width - 150,
            child: Text(
              message,
              // overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          // const Spacer(),
          // if (trailing != null)
          //   Text(
          //     trailing,
          //     style: const TextStyle(
          //       fontVariations: fontWeightW700,
          //       fontSize: 12,
          //       color: lWhite,
          //     ),
          //   )
        ],
      ),
    ),
  );
}
