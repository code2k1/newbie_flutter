import 'package:flutter/material.dart';
import 'package:klook/components/big_text.dart';

class TitleHome extends StatelessWidget {
  final String text;
  bool showDetail;

  TitleHome({required this.text, this.showDetail = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BigText(
            text: text,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          showDetail
              ? const Text(
                  "Xem thêm",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
