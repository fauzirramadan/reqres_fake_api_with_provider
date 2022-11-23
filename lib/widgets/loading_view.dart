import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.deepPurple,
            backgroundColor: Colors.deepPurple[200],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "PLEASE WAIT",
            style: TextStyle(
                color: Colors.purple,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
