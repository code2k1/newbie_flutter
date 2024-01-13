import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klook/components/small_text.dart';
import 'package:klook/mocs/data_search.dart';
import 'package:intl/intl.dart';
import 'package:klook/pages/detail/detail.dart';

class RecentlyViewed extends StatelessWidget {
  final List<Tour> tours;

  const RecentlyViewed(this.tours, {super.key});

  String formatCurrency(double amount) {
    // Định dạng tiền tệ theo ngôn ngữ Việt Nam
    var formatter =
        NumberFormat.currency(locale: "vi_VN", customPattern: "#,##0.00");

    // Áp dụng định dạng và trả về chuỗi đã định dạng
    return '₫ ${formatter.format(amount)}';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        padEnds: false,
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1,
          keepPage: true,
        ),
        itemCount: tours.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const Detail(),
                  settings: RouteSettings(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(tours.isNotEmpty
                            ? tours[index].urlImage
                            : 'your_placeholder_url'),
                        fit: BoxFit.cover, // Adjust the BoxFit as needed
                      ),
                    ),
                  ),
                  SmallText(
                    text: tours[index].title,
                    size: 12,
                    color: Colors.black,
                  ),
                  SmallText(
                    text: formatCurrency(tours[index].price),
                    size: 12,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
