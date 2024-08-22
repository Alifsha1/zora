import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/core/utils/alerts.dart';
import 'package:zora/presentaion/Widgets/elevated_button.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/Widgets/text_form_field.dart';
import 'package:zora/presentaion/bloc/user_login/user_login_bloc.dart';
import 'package:zora/presentaion/cubit/toggle_password/toggle_password.dart';
import 'package:zora/presentaion/pages/forgot_password/fogot_password_page.dart';
import 'package:zora/presentaion/pages/nav_bar/nav_bar.dart';

class UserLoginWidget extends StatelessWidget {
  const UserLoginWidget({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
    required this.mediawidth,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final double mediawidth;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserLoginBloc, UserLoginState>(
      listener: userLoginListener,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Textformfieldlog(
                  label: const Text('username'),
                  hint: 'Username',
                  controller: usernameController,
                  validator: (val) {
                    if (val!.length < 4) {
                      return 'Username should not be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<TogglePasswordCubit, bool>(
                    builder: (context, state) {
                  return Textformfieldlog(
                    yes: state,
                    label: const Text('password'),
                    hint: 'password',
                    controller: passwordController,
                    suffix: GestureDetector(
                      onTap: () {
                        context.read<TogglePasswordCubit>().toggle();
                      },
                      child: Icon(
                        state ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                        size: 20,
                      ),
                    ),
                    validator: (val) {
                      if (val!.length < 4) {
                        return 'Password should not be empty';
                      }
                      return null;
                    },
                  );
                }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPassword()));
                        },
                        child:
                            const NormalBondTitles(titles: 'Forgot Password?'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Buttonelevated(
                  mediawidth: mediawidth,
                  buttontext: 'Log in',
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (formKey.currentState!.validate()) {
                      context.read<UserLoginBloc>().add(UserloginEvent(
                          username: usernameController.text,
                          password: passwordController.text));
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void userLoginListener(BuildContext context, UserLoginState state) {
    if (state is InvalidUsernameErrorState) {
      customSnackbar(context, "Username doesn't exist", kred);
    }
    if (state is InvalidPasswordErrorState) {
      customSnackbar(context, "Incorrect password", kred);
    }
    if (state is BlockedbyAdminErrorState) {
      customSnackbar(context, 'you have been blocked by zora...', kred);
    }
    if (state is UserLoginSuccessState) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CustomNavBar()));
      context.read<TogglePasswordCubit>().reset();
    }
    if (state is UserSignInErrorState) {
      customSnackbar(context, "Incorrect password", kred);
    }
  }
}
