import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final bool isSuccess;
  final String message;

  CustomBottomSheet({required this.isSuccess, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSuccess ? Icons.check_circle : Icons.error,
            color: isSuccess ? Colors.green : Colors.red,
            size: 50,
          ),
          SizedBox(height: 10),
          Text(message),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}