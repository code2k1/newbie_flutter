import 'dart:async';
import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:klook/components/big_text.dart';
import 'package:klook/mocs/data_search.dart';

class SlidePreferential extends StatefulWidget {
  final List<ItemPreferential> itemPreferential;

  const SlidePreferential({super.key, required this.itemPreferential});

  @override
  State<SlidePreferential> createState() => _SlidePreferentialState();
}

class _SlidePreferentialState extends State<SlidePreferential> {
  late int currentPage = 0;
  late final CarouselController _pageControllerPreferential =
  CarouselController();


  @override
  Widget build(BuildContext context) {
    return _list(widget.itemPreferential);
  }

  Widget _list(List<ItemPreferential> itemPreferential) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            CarouselSlider(
              carouselController: _pageControllerPreferential,
              items: widget.itemPreferential.map((i) {
                return Image.network(
                  i.urlImage,
                  fit: BoxFit.cover,
                );
              }).toList(),
              options: CarouselOptions(
                  height: 250,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 500),
                  autoPlayCurve: Curves.easeInOut,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPage = index;
                    });
                  },
              ),

            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    BigText(
                      text:
                      '${currentPage % itemPreferential.length +
                          1}/${itemPreferential.length}',
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x80ffffff),
                              blurRadius: 1.0,
                              offset: Offset(3, 3),
                            ),
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
