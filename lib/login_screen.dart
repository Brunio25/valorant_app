import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextStyle loginLabelStyle = const TextStyle(
      color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold);

  bool _rememberMe = false; //TODO bloc

  Widget usernameField() {
    return TextFormField(
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIcon: Icon(Icons.perm_identity_sharp,
              color: Theme.of(context).primaryColor),
          hintStyle: const TextStyle(color: Colors.white),
          hintText: "Username"),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIcon: Icon(Icons.lock_open_rounded,
              color: Theme.of(context).primaryColor),
          hintStyle: const TextStyle(color: Colors.white),
          hintText: "Password"),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(5),
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              fixedSize: MaterialStateProperty.all<Size>(Size(200, 70))),
          child: Text("LOGIN", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF101822),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: InkWell(
          enableFeedback: false,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Image(
                  image: AssetImage("assets/images/background_image.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      usernameField(),
                      SizedBox(height: 25),
                      passwordField(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.only(top: 7),
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password?",
                            style: loginLabelStyle,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                              activeColor: Theme.of(context).primaryColor,
                              checkColor: Colors.white,
                              side: BorderSide(color: Colors.white),
                            ),
                          ),
                          Text(
                            "Remember me",
                            style: loginLabelStyle,
                          )
                        ],
                      ),
                      loginButton()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
