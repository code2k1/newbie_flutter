import 'package:flutter/material.dart';
import 'package:klook/components/small_text.dart';
import 'package:klook/themes/dimensions.dart';

class TextIcon extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color iconColor;


  const TextIcon({super.key, required this.icon, required this.text, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,size: 24),
        SizedBox(width: 5,),
        SmallText(text: text,)
      ],
    );
  }
}
