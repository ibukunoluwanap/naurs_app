import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naurs/utils/colors.dart';
import 'package:naurs/widgets/button/button.dart';
import 'package:naurs/widgets/input/input.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _globalKey = GlobalKey<FormState>();
  late String? _email, _password;
  bool _loader = false;

  @override
  Widget build(BuildContext context) {
    final dHeight = MediaQuery.of(context).size.height;
    final dWidth = MediaQuery.of(context).size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
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
          child: Stack(children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  _title(dHeight),
                  _form(dHeight),
                  _resetPassword(dWidth, dHeight),
                  _login(dHeight),
                ],
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                title: null,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  color: secondary,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget _title(dHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Reset Password",
          style: TextStyle(
              fontSize: 36.0, fontWeight: FontWeight.bold, color: secondary),
        ),
        SizedBox(height: (dHeight / 100) * 1),
        const Text(
          "Add your email below to receive a reset link.",
          style: TextStyle(fontSize: 14.0, color: secondary),
        ),
      ],
    );
  }

  Widget _form(dHeight) {
    return Padding(
      padding: EdgeInsets.only(top: (dHeight / 100) * 5),
      child: Form(
        key: _globalKey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorColor: secondary,
                validator: (inputData) {
                  if (inputData!.isEmpty) {
                    return "Email can't be empty!";
                  } else if (!(inputData.contains('@')) &&
                      inputData.isNotEmpty) {
                    return "Enter a valid email address";
                  }
                  return null;
                },
                onSaved: (value) => _email = value,
                style: const TextStyle(color: secondary, fontSize: 14),
                decoration:
                    input(labelText: "Email", hintText: "johndoe@example.com"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _resetPassword(dWidth, dHeight) {
    return Padding(
      padding: EdgeInsets.only(bottom: (dHeight / 100) * 2),
      child: _loader
          ? const Center(
              child: CircularProgressIndicator(
                color: secondary,
                strokeWidth: 2,
              ),
            )
          : button(
              dWidth: dWidth,
              title: "Reset",
              color: primary,
              background: secondary,
              onPressed: () {
                if (isValidated()) {
                  setState(() {
                    _loader = true;
                  });
                  // form data
                  _email;
                  _password;
                  setState(() {
                    _loader = false;
                  });
                }
              },
            ),
    );
  }

  Widget _login(dHeight) {
    return Padding(
      padding: EdgeInsets.only(bottom: (dHeight / 100) * .5),
      child: Center(
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, "login"),
          child: RichText(
              text: const TextSpan(
                  text: "Already a member? ",
                  style: TextStyle(fontSize: 14.0, color: secondary),
                  children: [
                TextSpan(
                  text: "Login",
                  style: TextStyle(fontSize: 14.0, color: pink),
                )
              ])),
        ),
      ),
    );
  }

  bool isValidated() {
    final form = _globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
