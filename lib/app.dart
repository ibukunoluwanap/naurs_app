import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naurs/screens/authentication/login/login.dart';
import 'package:naurs/screens/authentication/register/expectation.dart';
import 'package:naurs/screens/authentication/register/register.dart';
import 'package:naurs/screens/authentication/reset_password/reset_password.dart';
import 'package:naurs/screens/authentication/selector.dart';
import 'package:naurs/screens/home/home.dart';
import 'package:naurs/utils/colors.dart';

Widget _defaultHome = const Selector();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Naurs",
      color: primary,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primary),
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      home: _defaultHome,
      initialRoute: "home",
      routes: {
        "login": (_) => const Login(),
        "register": (_) => const Register(),
        "reset_password": (_) => const ResetPassword(),
        "expectation": (_) => const Expectation(),
        "home": (_) => const Home(),
      },
    );
  }
}
