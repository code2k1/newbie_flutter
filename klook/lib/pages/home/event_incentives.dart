import 'package:flutter/material.dart';
import 'package:klook/components/big_text.dart';
import 'package:klook/components/small_text.dart';

class EventIncentives extends StatelessWidget {
  const EventIncentives({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(78, 252, 252, 0.4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 236, 216, 1),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              child: Row(
                children: [
                  const Icon(
                    Icons.access_time_filled,
                    size: 20,
                    color: Color.fromRGBO(252, 171, 38, 1),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 5),
                      width: 130,
                      child: BigText(
                          text: "Kết thúc sau 1 ngày",
                          size: 13,
                          color: const Color.fromRGBO(252, 171, 38, 1))),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            BigText(text: "Giảm đến 500k", size: 15, color: Colors.black),
            const SizedBox(
              height: 5,
            ),
            SmallText(
                text: "Bão deal 12.12",
                size: 14,
                color: Colors.black.withOpacity(0.7)),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(246, 224, 224, 1.0)),
              child: const SmallText(
                  text: "Lấy ngay",
                  size: 13,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(246, 124, 102, 1.0)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 100,
              child: Image.asset(
                "assets/images/gift-box.png",
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
