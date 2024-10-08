import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

navigatorReplacement(page, context) {
  Navigator.of(context).pushReplacement(PageTransition(
      child: page,
      type: PageTransitionType.fade,
      duration: const Duration(seconds: 1)));
}

navigatorPush(page, context) {
  Navigator.of(context).push(PageTransition(
      child: page,
      type: PageTransitionType.fade,
      duration: const Duration(milliseconds: 1000)));
}

Future<dynamic> nextScreen(context, page) {
  return Navigator.push(
    context,
    PageTransition(
      child: page,
      type: PageTransitionType.fade,
    ),
  );
}

navigatorPushReplacement(page, context) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => page), (route) => false);
}

navigatorpop(context) {
  Navigator.pop(context);
}
