import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';

class PrivacyAndPolicy extends StatefulWidget {
  const PrivacyAndPolicy({super.key});

  @override
  State<PrivacyAndPolicy> createState() => _PrivacyAndPolicyState();
}

class _PrivacyAndPolicyState extends State<PrivacyAndPolicy> {
  late final WebViewController _controller;
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(
          'https://www.termsfeed.com/live/00bf158e-f7d7-462a-b180-e5b9ad0d7cac'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BoldTitles(titles: 'Privacy & Policy', fontsize: 20),
        backgroundColor: kwhite,
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
