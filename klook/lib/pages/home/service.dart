import 'package:flutter/material.dart';
import 'package:klook/components/small_text.dart';
import 'package:klook/mocs/data_search.dart';

class ServiceHome extends StatelessWidget {
  final List<ItemService> itemServices ;


  const ServiceHome(this.itemServices, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: PageView.builder(
        padEnds: false,
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 1 / 3,
          initialPage: 1,
          keepPage: true,
        ),
        itemCount: itemServices.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: SmallText(
                    text: itemServices[index].title,
                    size: 11,
                    color: Colors.black,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  height: 30,
                  child: Image.asset(itemServices[index].urlImage),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}