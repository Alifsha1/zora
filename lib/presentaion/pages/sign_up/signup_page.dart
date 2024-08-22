// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/core/utils/alerts.dart';
import 'package:zora/core/utils/validation.dart';
import 'package:zora/presentaion/Widgets/elevated_button.dart';
import 'package:zora/presentaion/Widgets/text_form_field.dart';
import 'package:zora/presentaion/Widgets/zora.dart';
import 'package:zora/presentaion/bloc/sign_up_bloc/sign_up_bloc_bloc.dart';
import 'package:zora/presentaion/pages/otp_verification/verification_page.dart';
import 'package:zora/presentaion/pages/sign_up/widgets/login_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;

    final mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: BlocListener<SignUpBlocBloc, SignUpBlocState>(
      listener: (context, state) {
        if (state is USerOtpSucceccState) {
          customSnackbar(context, "Otp send successfully", Colors.green);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contex) => OtpVerificationPage(
                username: usernameController.text,
                email: emailController.text,
                fullname: fullnameController.text,
                phoneno: phonenumberController.text,
                password: passwordController.text,
                confirmpassword: confirmpasswordController.text,
              ),
            ),
          );
        }
        if (state is UsernameExistsErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("User name Already exists")));
        }
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainHeading(heading: 'Create your account'),
                  ],
                ),
                SizedBox(
                  height: mediaheight * .06,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Textformfieldlog(
                        label: Text('full name'),
                        hint: 'Full name',
                        controller: fullnameController,
                        validator: (val) {
                          if (val!.length < 3) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        },
                      ),
                      kheight20,
                      Textformfieldlog(
                        label: Text('Username'),
                        hint: ' Username',
                        controller: usernameController,
                        validator: (val) {
                          if (val!.length < 4) {
                            return 'Username should have at least 4 characters';
                          }
                          if (val.endsWith('.') || val.endsWith('_')) {
                            return "Username cant't end with period or underscore";
                          }
                          if (!RegExp(
                                  r"^(?=.{4,20}$)(?![_.])[a-zA-Z0-9._]+(?<![_.])$")
                              .hasMatch(val)) {
                            return 'Username can only user letters, numbers, underscore and periods';
                          }
                          return null;
                        },
                      ),
                      kheight20,
                      Textformfieldlog(
                        label: Text('email'),
                        hint: 'email',
                        controller: emailController,
                        validator: (val) {
                          if (!RegExp(emailRegexPattern).hasMatch(val!) ||
                              val.isEmpty) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      kheight20,
                      Textformfieldlog(
                        label: Text('phone no'),
                        hint: 'phone number',
                        controller: phonenumberController,
                        validator: (val) {
                          if (val!.length < 10) {
                            return 'Enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      kheight20,
                      Textformfieldlog(
                        label: Text('create password'),
                        hint: 'Create password',
                        controller: passwordController,
                        validator: (val) {
                          if (!RegExp(passowrdRegexPattern).hasMatch(val!)) {
                            return 'Password should be 8 characters, at least onr number and one special character';
                          }
                          return null;
                        },
                      ),
                      kheight20,
                      Textformfieldlog(
                        label: Text('confirm password'),
                        hint: 'confirm passwpord',
                        controller: confirmpasswordController,
                        validator: (val) {
                          if (!RegExp(passowrdRegexPattern).hasMatch(val!)) {
                            return 'Password should be 8 characters, at least onr number and one special character';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Buttonelevated(
                        mediawidth: mediawidth,
                        buttontext: 'Register',
                        onPressed: () {
                          if (passwordController.text ==
                              confirmpasswordController.text) {
                            if (formKey.currentState!.validate()) {
                              context.read<SignUpBlocBloc>().add(
                                  UserOtpVerificationEvent(
                                      email: emailController.text));
                            }
                            //customSnackbar(context, "Otp send successfully",Colors.green);
                          } else {
                            customSnackbar(
                                context, "Password doesn't match", Colors.red);
                          }
                        },
                      ),
                      kheight10,
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              endIndent: 10,
                            ),
                          ),
                          Text('Or'),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              indent: 10,
                            ),
                          ),
                        ],
                      ),
                      kheight10,
                    
                      kheight10,
                      LoginWidget(),
                      kheight10,
                     
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
