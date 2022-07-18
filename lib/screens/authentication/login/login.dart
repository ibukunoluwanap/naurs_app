import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naurs/utils/colors.dart';
import 'package:naurs/widgets/button/button.dart';
import 'package:naurs/widgets/input/input.dart';
import 'package:naurs/widgets/o2auth/o2auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _globalKey = GlobalKey<FormState>();

  late String? _email, _password;

  bool _isObscure = true;
  bool _loader = false;

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
          child: Stack(children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  _title(dHeight),
                  o2auth(dWidth, dHeight),
                  _form(),
                  _login(dWidth, dHeight),
                  _register(dHeight),
                  _resetPassword(dHeight),
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
          "Login",
          style: TextStyle(
              fontSize: 36.0, fontWeight: FontWeight.bold, color: secondary),
        ),
        SizedBox(height: (dHeight / 100) * 1),
        const Text(
          "Login with the following options below.",
          style: TextStyle(fontSize: 14.0, color: secondary),
        ),
      ],
    );
  }

  Widget _form() {
    return Form(
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
                } else if (!(inputData.contains('@')) && inputData.isNotEmpty) {
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
          Container(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorColor: secondary,
              obscureText: _isObscure,
              validator: (inputData) =>
                  inputData!.isEmpty ? "Password can't be empty!" : null,
              onSaved: (value) => _password = value,
              style: const TextStyle(color: secondary, fontSize: 14),
              decoration: input(
                  labelText: "Password",
                  hintText: "**********",
                  suffixIcon:
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                  suffixIconOnTap: () => {
                        setState(() {
                          _isObscure = !_isObscure;
                        })
                      }),
            ),
          )
        ],
      ),
    );
  }

  Widget _login(dWidth, dHeight) {
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
              title: "Log In",
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
                  Navigator.pushNamed(context, "home");
                  setState(() {
                    _loader = false;
                  });
                }
              },
            ),
    );
  }

  Widget _register(dHeight) {
    return Padding(
      padding: EdgeInsets.only(bottom: (dHeight / 100) * .5),
      child: Center(
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, "expectation"),
          child: RichText(
              text: const TextSpan(
                  text: "A new member? ",
                  style: TextStyle(fontSize: 14.0, color: secondary),
                  children: [
                TextSpan(
                  text: "Register",
                  style: TextStyle(fontSize: 14.0, color: pink),
                )
              ])),
        ),
      ),
    );
  }

  Widget _resetPassword(dHeight) {
    return Padding(
      padding: EdgeInsets.only(top: (dHeight / 100) * .5),
      child: Center(
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, "reset_password"),
          child: const Text(
            "I forgot my password!",
            style: TextStyle(fontSize: 12.0, color: pink),
          ),
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
