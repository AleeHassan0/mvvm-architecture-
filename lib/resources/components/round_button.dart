import 'package:flutter/material.dart';
import 'package:mvvm_project/resources/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.buttonColor),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(
              color: AppColor.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        )),
      ),
    );
  }
}
