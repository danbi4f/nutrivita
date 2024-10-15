import 'package:flutter/material.dart';

class ErrorFoodWidget extends StatelessWidget {
  const ErrorFoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Something was wrong',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
