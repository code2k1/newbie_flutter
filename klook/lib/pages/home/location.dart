import 'package:flutter/material.dart';
import 'package:klook/components/small_text.dart';
import 'package:klook/mocs/data_search.dart';
import 'package:intl/intl.dart';

class Location extends StatelessWidget {
  final List<Tour> tours;

  const Location(this.tours, {super.key});

  String formatCurrency(double amount) {
    // Định dạng tiền tệ theo ngôn ngữ Việt Nam
    var formatter = NumberFormat.currency(locale: "vi_VN",customPattern: "#,##0.00");

    // Áp dụng định dạng và trả về chuỗi đã định dạng
    return '₫ ${formatter.format(amount)}';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: PageView.builder(
        padEnds: false,
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.45,
          initialPage: 1,
          keepPage: true,
        ),
        itemCount: tours.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            clipBehavior:Clip.hardEdge ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    tours.isNotEmpty
                        ? tours[index].urlImage
                        : 'your_placeholder_url',
                    fit: BoxFit.cover, // Adjust the BoxFit as needed
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2)
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: SmallText(
                    text: tours[index].location,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
