import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/utils/alerts.dart';
import 'package:zora/core/utils/validation.dart';
import 'package:zora/presentaion/Widgets/elevated_button.dart';
import 'package:zora/presentaion/Widgets/text_form_field.dart';
import 'package:zora/presentaion/Widgets/zora.dart';
import 'package:zora/presentaion/bloc/forget_password/forget_password_bloc.dart';
import 'package:zora/presentaion/pages/user_login/login_page.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  const ResetPasswordScreen({super.key, required this.email});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainHeading(heading: 'Forgot your password'),
                  ],
                ),
                SizedBox(
                  height: mediaheight * .15,
                ),
                Textformfieldlog(
                   label: Text('otp'),
                  hint: 'OTP',
                  controller: otpController,
                  validator: (val) {
                    if (val!.length < 6) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
                sizedboxconst20(),
                Textformfieldlog(
                   label: Text('New password'),
                  hint: 'New password',
                  controller: passwordController,
                  validator: (val) {
                    if (!RegExp(passowrdRegexPattern).hasMatch(val!) ||
                        val.isEmpty) {
                      return 'password should be 8 character at least one number and one special chararcter';
                    }
                    return null;
                  },
                ),
                sizedboxconst20(),
                Textformfieldlog(
                   label: Text('confirm password'),
                  hint: 'Confirm password',
                  controller: confirmpasswordController,
                  validator: (val) {
                    if (!RegExp(passowrdRegexPattern).hasMatch(val!) ||
                        val.isEmpty) {
                      return 'password should be 8 character at least one number and one special chararcter';
                    }
                    return null;
                  },
                ),
                sizedboxconst20(),
                BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
                  listener: resetPasswordListener,
                  child: Buttonelevated(
                    mediawidth: mediawidth,
                    buttontext: 'sent-Otp',
                    // navigate: UserLogin(),
                    onPressed: () {
                      if (passwordController.text ==
                          confirmpasswordController.text) {
                        if (formKey.currentState!.validate()) {
                          context.read<ForgetPasswordBloc>().add(
                              ForgetResetPasswordEvent(
                                  email: widget.email,
                                  otp: otpController.text,
                                  password: passwordController.text));
                        }
                      }else{
                        customSnackbar(context, "Password does n't match", Colors.red);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  SizedBox sizedboxconst20() {
    return const SizedBox(
      height: 20,
    );
  }

  SizedBox sizedboxconst10() {
    return const SizedBox(
      height: 10,
    );
  }

  void resetPasswordListener(BuildContext context, ForgetPasswordState state) {
    if (state is ForgetResetPasswordSuccessState) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const UserLogin()),
          (route) => false);
      customSnackbar(context, 'Password changed successfully', Colors.green);
    }
    if (state is ForgetResetPasswordInvalidOtpState) {
      customSnackbar(context, 'Entered OTP is invalid', Colors.red);
    }
   
  }
}
