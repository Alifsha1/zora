import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/utils/alerts.dart';
import 'package:zora/core/utils/validation.dart';
import 'package:zora/presentaion/Widgets/elevated_button.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/Widgets/text_form_field.dart';
import 'package:zora/presentaion/Widgets/zora.dart';
import 'package:zora/presentaion/bloc/forget_password/forget_password_bloc.dart';
import 'package:zora/presentaion/pages/forgot_password/reset_password.dart';
import 'package:zora/presentaion/pages/sign_up/widgets/login_widget.dart';

class ForgetPageField extends StatefulWidget {
  const ForgetPageField({
    super.key,
    required this.mediaheight,
    //required this.emailController,
    required this.mediawidth,
  });

  final double mediaheight;
 // final TextEditingController emailController;
  final double mediawidth;

  @override
  State<ForgetPageField> createState() => _ForgetPageFieldState();
}

class _ForgetPageFieldState extends State<ForgetPageField> {
  final TextEditingController emailcontroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 80),
      child: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MainHeading(heading: 'Forgot your password'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NormalBondTitles(
                      titles:
                          'Enter your email Address \nwe will send you an Otp')
                ],
              ),
              SizedBox(
                height: widget.mediaheight * .05,
              ),
              BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
                listener: forgetPasswordListener,
                child: Textformfieldlog(
                  hint: 'Email',
                  controller: emailcontroller,
                  validator: (val) {
                    if (!RegExp(emailRegexPattern).hasMatch(val!) ||
                        val.isEmpty) {
                      return 'Enter a valid email';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              sizedboxconst20(),
              Buttonelevated(
                mediawidth: widget.mediawidth,
                buttontext: 'sent-Otp',
                onPressed: () {
                  print('email in forgetpage :${emailcontroller.text}');
                  if (formKey.currentState!.validate()) {
                    context
                        .read<ForgetPasswordBloc>()
                        .add(ForgetSentOtpEvent(email: emailcontroller.text));
                  }
                },
                // navigate: UserLogin(),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(20),
                child: LoginWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox sizedboxconst20() {
    return SizedBox(
      height: 20,
    );
  }

  SizedBox sizedboxconst10() {
    return SizedBox(
      height: 10,
    );
  }

  void forgetPasswordListener(BuildContext context, ForgetPasswordState state) {
    if (state is ForgetSentOtpSuccessState) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResetPasswordScreen(email: emailcontroller.text),
        ),
      );
    }
    if (state is ForgetUserNotExistsState) {
      customSnackbar(context, 'User not found with the email',Colors.red);
    }
  }
}
