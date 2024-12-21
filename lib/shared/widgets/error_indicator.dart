import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  final String errorMessage;
  const ErrorIndicator({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.red,
            ),
      ),
    );
  }
}
