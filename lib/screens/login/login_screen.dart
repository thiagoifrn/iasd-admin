import 'package:admin/screens/login/components/sign_up_top_image.dart';
import 'package:admin/util/app_routes.dart';
import 'package:admin/util/constants.dart';
import 'package:flutter/material.dart';
import 'components/login_screen_top_image.dart';
import '../../components/background.dart';
import '../../responsive.dart';

enum AuthMode { signup, login }

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthMode _authMode = AuthMode.login;

  bool _isLogin() => _authMode == AuthMode.login;
  bool _isSignup() => _authMode == AuthMode.signup;

  _switchAuthMode() {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.signup;
      } else {
        _authMode = AuthMode.login;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileLoginScreen(),
          desktop: Row(
            children: [
              Expanded(
                child:
                    _isLogin() ? LoginScreenTopImage() : SignUpScreenTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              cursorColor: kPrimaryColor,
                              onSaved: (email) {},
                              decoration: InputDecoration(
                                hintText: "Seu e-mail",
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(defaultPadding),
                                  child: Icon(Icons.person),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: defaultPadding),
                              child: TextFormField(
                                textInputAction: TextInputAction.done,
                                obscureText: true,
                                cursorColor: kPrimaryColor,
                                decoration: InputDecoration(
                                  hintText: "Sua senha",
                                  prefixIcon: Padding(
                                    padding:
                                        const EdgeInsets.all(defaultPadding),
                                    child: Icon(Icons.lock),
                                  ),
                                ),
                              ),
                            ),
                            _isSignup()
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: defaultPadding),
                                    child: TextFormField(
                                      textInputAction: TextInputAction.done,
                                      obscureText: true,
                                      cursorColor: kPrimaryColor,
                                      decoration: InputDecoration(
                                        hintText: "Confirmar senha",
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(
                                              defaultPadding),
                                          child: Icon(Icons.lock),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(height: defaultPadding),
                            Hero(
                              tag: "login_btn",
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, AppRoutes.login);
                                },
                                child: Text(
                                  _isLogin() ? 'ACESSAR' : 'REGISTRAR',
                                ),
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            TextButton(
                                onPressed: _switchAuthMode,
                                child: Text(_isLogin()
                                    ? 'DESEJA REGISTRAR?'
                                    : 'JÁ POSSUI CONTA?'))
                          ],
                        ),
                      ),
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
        const LoginScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: Text('LUIZ cARLOS DA sILVA'),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
