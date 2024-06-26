import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:zora/core/utils/alerts.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/Widgets/elevated_button.dart';
import 'package:zora/presentaion/Widgets/zora.dart';
import 'package:zora/presentaion/bloc/sign_up_bloc/sign_up_bloc_bloc.dart';
import 'package:zora/presentaion/pages/user_login/login_page.dart';

class OtpVerificationPage extends StatefulWidget {
  final String fullname;
  final String username;
  final String email;
  final String phoneno;
  final String password;
  final String confirmpassword;
  const OtpVerificationPage({
    super.key,
    required this.email,
    required this.fullname,
    required this.phoneno,
    required this.password,
    required this.confirmpassword,
    required this.username,
  });

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final OtpFieldController otpController = OtpFieldController();

  final String accountType = "public";
  String? otp;
  @override
  Widget build(BuildContext context) {
    final mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
        child: Column(
          children: [
            Column(
              children: [
                const Row(
                  children: [
                    MainHeading(heading: 'Verification Code'),
                  ],
                ),
                SizedBox(
                  height: mediaheight * .02,
                ),
                const Row(
                  children: [
                    Text(
                      'we have send the verification code to ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 127, 162, 194),
                        fontWeight: FontWeight.normal,
                        fontFamily: "Quick_sand",
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaheight * .01,
                ),
                Row(
                  children: [
                    Text(
                      widget.email,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Quick_sand",
                          fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaheight * .02,
                ),
              ],
            ),
            BlocConsumer<SignUpBlocBloc, SignUpBlocState>(
              listener: (context, state) {
                if (state is UserSignUpSuccessState) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserLogin()),
                      (route) => false);
                }
                if (state is UsernameExistsErrorState) {
                  debugPrint('Username already exixts');

                  customSnackbar(context, "username already exists",Colors.red);
                }
                if (state is EmailExistsErrorState) {
                  debugPrint('Email already exists');
                  customSnackbar(context, "Email already exists",Colors.red);
                }
                if (state is PhonenoExistsErrorState) {
                  debugPrint('Phoneno already exists');
                  customSnackbar(context, "Phone number already exists",Colors.red);
                }
              },
              builder: (context, state) {
                return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      OTPTextField(
                        controller: otpController,
                        length: 6,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 40,
                        style: const TextStyle(fontSize: 17),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.box,
                        onChanged: (value) {},
                        onCompleted: (pin) {
                          otp = pin;
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: mediaheight * .02,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Haven’t recieved OTP yet? ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 127, 162, 194),
                      fontWeight: FontWeight.normal,
                      fontFamily: "Quick_sand"),
                ),
                Text(
                  'Resend',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Quick_sand"),
                ),
              ],
            ),
            SizedBox(
              height: mediaheight * .02,
            ),
            signUpButton(
                formKey,
                otp,
                accountType,
                widget.username,
                widget.password,
                widget.email,
                widget.fullname,
                widget.phoneno,
                context),
          ],
        ),
      )),
    );
  }

  static Widget signUpButton(
      GlobalKey<FormState> formKey,
      String? otp,
      String? accountType,
      String? username,
      String? password,
      String? email,
      String? fullName,
      String? phoneNo,
      BuildContext context) {
    return Buttonelevated(
      mediawidth: MediaQuery.of(context).size.width,
      buttontext: 'verify',
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final user = UserModel(
            accountType: accountType,
            username: username,
            password: password,
            email: email,
            fullName: fullName,
            phonenumber: int.parse(phoneNo ?? '0'),
            otp: otp,
          );
          context.read<SignUpBlocBloc>().add(UserSignedEvent(user: user));
        }
      },
    );
  }
}
