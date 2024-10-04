import 'package:flutter/material.dart';
import 'package:mvvm_project/utils/routes/routes_name.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.home);
            },
            child: const Text('Click')),
      ),
    );
  }
}
