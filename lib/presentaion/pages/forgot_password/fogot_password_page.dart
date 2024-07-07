import 'package:flutter/material.dart';
import 'package:zora/presentaion/pages/forgot_password/widgets/forget_page_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
 // final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: ForgetPageField(
          mediaheight: mediaheight,
         // emailController: emailController,
          mediawidth: mediawidth,
        ),
                          

      ),
    );
  }
}
