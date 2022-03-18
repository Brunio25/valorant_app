import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween(begin: 300, end: 50).animate(_controller)
    ..addListener(() {
      setState(() { });
    });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.forward();
      }
      else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();

    super.dispose();
  }

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
      focusNode: _focusNode,
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
      focusNode: _focusNode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF101822),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: InkWell(
          enableFeedback: false,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
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
                    SizedBox(height: _animation.value),                      //TODO animation
                    usernameField(),
                    SizedBox(height: 30),
                    passwordField()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
