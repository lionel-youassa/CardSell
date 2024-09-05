import 'package:flutter/material.dart';


class ButtonProfile extends StatelessWidget {
  String imageUrl = "";
  double width = 1;
  double height = 1;
  final VoidCallback onTap;

  ButtonProfile(
      {super.key, required this.imageUrl, required this.onTap, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: ClipOval(
          child: Image.network(
            imageUrl,
            width: width,
            height: height,
            fit: BoxFit.cover,

          ),

        ));

  }
}