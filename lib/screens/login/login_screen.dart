import 'package:admin/screens/login/controller_alth_login.dart';
import 'package:admin/screens/login/components/sign_up_top_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';
import '../../components/background.dart';
import '../../responsive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // AuthMode _authMode = AuthMode.login;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileLoginScreen(),
          desktop: Row(
            children: [
              Expanded(
                child: Provider.of<ControllerAlthLogin>(context).isLogin()
                    ? LoginScreenTopImage()
                    : SignUpScreenTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      child: LoginForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Provider.of<ControllerAlthLogin>(context).isLogin()
            ? LoginScreenTopImage()
            : SignUpScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
