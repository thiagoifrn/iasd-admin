import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/screens/Login/login_screen.dart';
import 'package:admin/screens/Welcome/welcome_screen.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/secretary/documents.dart';
import 'package:admin/util/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controllers/controller_alth_login.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
        ChangeNotifierProvider(
          create: (context) => MenuAppController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ControllerAlthLogin(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      routes: {
        AppRoutes.HOME: (context) => WelcomeScreen(),
        AppRoutes.PAINEL: (_) => MainScreen(),
        AppRoutes.LOGIN: (_) => const LoginScreen(),
        AppRoutes.DASH: (_) => DashboardScreen(),
        AppRoutes.DOCUMENTS: (_) => Documents(),
      },
    );
  }
}
