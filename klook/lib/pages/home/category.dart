import 'package:flutter/material.dart';
import 'package:klook/components/icon_text.dart';
import 'package:klook/components/small_text.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFe8e8e8),
            blurRadius: 5.0,
            offset: Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-5, 0),
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(5, 0),
          )
        ],
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconText(
                text: "Tour & Trải nghiệm",
                urlImage: "assets/images/hot-air-balloon.png",
              ),
              IconText(
                text: "Vé tham quan",
                urlImage: "assets/images/ticket.png",
              ),
              IconText(
                text: "Khách sạn",
                urlImage: "assets/images/hotel.png",
              ),
              IconText(
                text: "Di chuyển",
                urlImage: "assets/images/bus.png",
              ),
              IconText(
                text: "Thuê xe tự lái",
                urlImage: "assets/images/vehicle.png",
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 20,
                    child: Image.asset(
                      "assets/images/application.png",
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  width: 10,
                ),
                const SmallText(
                  text: "Tất cả các mục",
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  size: 14,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
