import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:klook/components/small_text.dart';
import 'package:klook/mocs/data_search.dart';
import 'package:intl/intl.dart';

class ExploreMore extends StatefulWidget {
  final List<Tour> tours;
  final bool isLoading;
  final Function fetch;

  const ExploreMore({super.key, required this.tours, required this.isLoading, required this.fetch});

  @override
  State<ExploreMore> createState() => _ExploreMoreState();
}

class _ExploreMoreState extends State<ExploreMore> {

  late bool isLoading;
  List<Tour> listTours = [];

  @override
  void initState() {
    super.initState();
    listTours = widget.tours;

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification.metrics.pixels ==
            notification.metrics.maxScrollExtent) {
          isLoading = true;
          widget.fetch();
        }
        return false;
      },
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverMasonryGrid.count(
            crossAxisCount: 2,
            childCount: listTours.length,
            mainAxisSpacing: 10,
            itemBuilder: (BuildContext context, int index) {
              Tour e = listTours[index];
              if (e.isTotal == false) {
                return Container(
                  key: ValueKey(e),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 120,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(e.urlImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_pin,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                SmallText(
                                  text: listTours[index].location,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SmallText(
                        text: e.title,
                        size: 14,
                        color: Colors.black,
                        maxLine: 3,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.orangeAccent.withOpacity(0.2)),
                        child: SmallText(
                          text:
                              "${widget.tours[index].orderedQuantity}+ Đã được đặt",
                          size: 12,
                          color: Colors.redAccent.withBlue(10),
                        ),
                      ),
                      SmallText(
                        text: formatCurrency(e.price),
                        size: 14,
                        color: Colors.black,
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  key: ValueKey(e),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 220,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(e.urlImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_pin,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                    SmallText(
                                      text: e.location,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                const SmallText(
                                  text: "1383 hoạt động",
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  String formatCurrency(double amount) {
    // Định dạng tiền tệ theo ngôn ngữ Việt Nam
    var formatter =
        NumberFormat.currency(locale: "vi_VN", customPattern: "#,##0.00");

    // Áp dụng định dạng và trả về chuỗi đã định dạng
    return '₫ ${formatter.format(amount)}';
  }
}
