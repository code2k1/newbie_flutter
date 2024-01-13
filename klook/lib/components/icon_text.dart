import 'package:flutter/material.dart';
import 'package:klook/components/small_text.dart';

class IconText extends StatelessWidget {
  final String text;
  final String urlImage;
  const IconText({super.key, required this.text, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 45,
              child: Image.asset(
                urlImage,
                fit: BoxFit.contain,
              )),
          SmallText(text: text,color: Colors.black,textAlign: TextAlign.center,size: 12,),
        ],
      ),
    );
  }
}
