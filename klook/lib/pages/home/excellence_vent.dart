import 'package:flutter/material.dart';
import 'package:klook/components/small_text.dart';
import 'package:klook/mocs/data_search.dart';
import 'package:intl/intl.dart';

class ExcellenceEvent extends StatelessWidget {
  final List<Tour> tours;

  const ExcellenceEvent(this.tours, {super.key});

  String formatCurrency(double amount) {
    // Định dạng tiền tệ theo ngôn ngữ Việt Nam và không bao gồm ký hiệu tiền tệ
    var formatter = NumberFormat.currency(locale: "vi_VN", customPattern: "#,##0.00");

    // Áp dụng định dạng và trả về chuỗi đã định dạng
    return '₫ ${formatter.format(amount)}';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
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
                  text: tours[index].type,
                  size: 11,
                  color: Colors.black.withOpacity(0.5),
                ),
                SmallText(
                  text: tours[index].title,
                  size: 14,
                  color: Colors.black,
                ),
                Row(
                  children: [
                    const Icon(Icons.star,size: 14, color: Colors.orangeAccent,),
                    SmallText(
                      text: tours[index].rate.toString(),
                      size: 12,
                      color: Colors.orangeAccent,
                    ),
                    SmallText(
                      text: '(${tours[index].numberRate})',
                      size: 12,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
                Row(
                  children: tours[index].services.map((e) {
                    return Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black12),
                          child: SmallText(
                            text: e.toString(),
                            size: 10,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    );
                  }).toList(),
                ),
                SmallText(
                  text: formatCurrency(tours[index].price),
                  size: 14,
                  color: Colors.black,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orangeAccent.withOpacity(0.2)),
                  child: SmallText(
                    text: tours[index].support,
                    size: 12,
                    color: Colors.redAccent.withBlue(10),
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
