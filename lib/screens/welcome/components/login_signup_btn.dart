import 'package:admin/util/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../login/login_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(fixedSize: Size(300, 40)),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.LOGIN);
            },
            child: Text(
              "acessar".toUpperCase(),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
