import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/utils/validation.dart';
import 'package:zora/presentaion/Widgets/elevated_button.dart';
import 'package:zora/presentaion/Widgets/zora.dart';
import 'package:zora/presentaion/bloc/sign_up_bloc/sign_up_bloc_bloc.dart';

class EmailForOtp extends StatefulWidget {
  const EmailForOtp({super.key});

  @override
  State<EmailForOtp> createState() => _EmailForOtpState();
}

class _EmailForOtpState extends State<EmailForOtp> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [MainHeading(heading: 'Otp Sent')],
            ),
            SizedBox(
              height: mediaheight * .14,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    //Textformfieldlog(hint: 'Email',controller: emailController,),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (!RegExp(emailRegexPattern).hasMatch(value!) ||
                            value.isEmpty) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        //   suffixIcon: Icon(icons),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 127, 162, 194),
                          fontWeight: FontWeight.bold,
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 244, 255, 255),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<SignUpBlocBloc,SignUpBlocState>(builder: (context, state) {
                      return Buttonelevated(
                        mediawidth: mediawidth,
                        buttontext: 'Sent otp',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<SignUpBlocBloc>().add(
                                UserOtpVerificationEvent(
                                    email: emailController.text));
                          }
                        },
                      );
                    })
                  ],
                ),
              ),
            ),
            SizedBox(
              height: mediaheight * .37,
            ),
          ],
        ),
      )),
    );
  }

 
}
