import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zora/presentaion/pages/user_login/login_page.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: TextStyle(
              color: Color.fromARGB(255, 127, 162, 194),
              fontWeight: FontWeight.normal,
              fontFamily: "Quick_sand"),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => UserLogin()),
                (route) => false);
          },
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.normal,
                fontFamily: "Quick_sand"),
          ),
        ),
      ],
    );
  }
}
