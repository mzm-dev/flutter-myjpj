import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.sizes, required this.radius});

  final double sizes;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: sizes,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      child: Text(
        'My JPJ',
        style: TextStyle(
          shadows: const [
            Shadow(
              color: Colors.black,
              offset: Offset(1, 1),
            )
          ],
          fontSize: radius,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
