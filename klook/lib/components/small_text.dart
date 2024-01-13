import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final int maxLine;
  final TextDecoration decoration;
  const SmallText(
      {super.key,
      this.color = const Color(0xff807c7c),
      required this.text,
      this.size = 0,
        this.textAlign =TextAlign.start,
        this.fontWeight =FontWeight.w500,
        this.maxLine = 2,
        this.decoration = TextDecoration.none
      });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        softWrap: true,
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          decoration: decoration,
            color: color,
            fontFamily: "Roboto",
            fontSize: size==0 ? 13:size,
            fontWeight: fontWeight));
  }
}
