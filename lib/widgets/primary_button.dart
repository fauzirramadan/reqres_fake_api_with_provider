import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String? child;
  final void Function()? onTap;
  const PrimaryButton({super.key, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      height: 50,
      color: Colors.deepPurple,
      child: Text(
        child ?? "",
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
