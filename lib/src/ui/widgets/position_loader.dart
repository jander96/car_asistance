import 'package:flutter/material.dart';

class CircleProgressWidget extends StatelessWidget {
  const CircleProgressWidget({super.key});




  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 56.0,
          height: 56.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),
          child: const Center(
            child: Icon(Icons.location_searching),
          ),
        ),
        const SizedBox(
          width: 56.0,
          height: 56.0,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ],
    );
  }
}