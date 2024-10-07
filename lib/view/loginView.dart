// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:mvvm_project/resources/components/round_button.dart';
import 'package:mvvm_project/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurepass = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();

  ///to store email and password
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    ///when we leave this screen this function will dipose everything and will release our RAM
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurepass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Login',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

        ///in android default text is at the start
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined), hintText: 'Email'),
              onFieldSubmitted: (value) {
                Utils.focusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurepass,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurepass.value,
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecurepass.value = !_obsecurepass.value;
                            },
                            child: Icon(_obsecurepass.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                        prefixIcon: const Icon(Icons.lock_outline),
                        hintText: 'Password'),
                  );
                }),
            const SizedBox(
              height: 30,
            ),
            RoundButton(
                title: "Login",
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBar("Please enter email", context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBar("Please enter password", context);
                  } else if (_passwordController.text.length < 8) {
                    Utils.flushBar(
                        "password should be greater than 8", context);
                  } else {
                    Utils.toastMessage("login successful");
                  }
                })
          ],
        ),
      ),
    );
  }
}
