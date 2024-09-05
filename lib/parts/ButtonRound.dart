import 'package:flutter/material.dart';



class ButtonRound extends StatelessWidget {
  String imageUrl = "";
  double width = 1;
  double height = 1;
  final VoidCallback onTap;

  ButtonRound(
      {super.key, required this.imageUrl, required this.onTap, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration( shape: BoxShape.circle, border: Border.all(color: const Color(
          -185339150)) ),
      child: GestureDetector(
          onTap: onTap,
          child: ClipOval(
            child: Image.network(
              imageUrl,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),

          )),
    );
  }
}