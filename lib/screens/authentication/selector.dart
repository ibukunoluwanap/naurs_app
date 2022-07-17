import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naurs/screens/authentication/privacy_policies.dart';
import 'package:naurs/utils/colors.dart';
import 'package:naurs/widgets/button/button.dart';

class Selector extends StatelessWidget {
  const Selector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dHeight = MediaQuery.of(context).size.height;
    final dWidth = MediaQuery.of(context).size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: Colors.transparent,
        ),
        child: Scaffold(
          body: Container(
              width: dWidth,
              height: dHeight,
              decoration: BoxDecoration(
                color: primary,
                gradient: LinearGradient(
                  colors: [primary.withOpacity(.8), primary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                        width: dWidth,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/img/selector.png"),
                                fit: BoxFit.fill))),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: dWidth,
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: secondary),
                          ),
                          RichText(
                              text: const TextSpan(
                                  text: "to ",
                                  style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.w300,
                                      color: secondary),
                                  children: [
                                TextSpan(
                                  text: "Naurs",
                                  style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold,
                                      color: secondary),
                                )
                              ])),
                          SizedBox(height: (dHeight / 100) * 3),
                          const Text(
                            """Get, started on your new journey to learning and building up your body, music and fine art skills""",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w200,
                                color: secondary),
                          ),
                          SizedBox(height: (dHeight / 100) * 3),
                          button(
                            dWidth: dWidth,
                            onPressed: () =>
                                Navigator.pushNamed(context, "expectation"),
                            title: "Register Now",
                            color: primary,
                            background: secondary,
                          ),
                          SizedBox(height: (dHeight / 100) * 2),
                          Center(
                            child: GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, "login"),
                              child: RichText(
                                  text: const TextSpan(
                                      text: "Already a member? ",
                                      style: TextStyle(
                                          fontSize: 14.0, color: secondary),
                                      children: [
                                    TextSpan(
                                      text: "Login",
                                      style: TextStyle(
                                          fontSize: 14.0, color: pink),
                                    )
                                  ])),
                            ),
                          ),
                          SizedBox(height: (dHeight / 100) * 1),
                          Center(
                              child: GestureDetector(
                            onTap: () => privacyPolicies(context, dHeight),
                            child: const Text(
                              "naurs privacy policies",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w200,
                                  color: pink),
                            ),
                          )),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
