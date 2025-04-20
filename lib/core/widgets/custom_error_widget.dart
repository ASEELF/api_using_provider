import 'package:flutter/material.dart';
import 'package:untitled2/core/theme/color_manager.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 48, color: ColorManager.error),
          SizedBox(height: 16),
          Text(
            'Error: $errorMessage',
            textAlign: TextAlign.center,
            style: TextStyle(color: ColorManager.backgroundDark),
          ),
          SizedBox(height: 16),
          ElevatedButton(onPressed: onRetry, child: Text('Retry')),
        ],
      ),
    );
  }
}
