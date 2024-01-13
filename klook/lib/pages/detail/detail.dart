import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klook/components/small_text.dart';
import 'package:klook/components/video_custom.dart';
import 'package:sliver_tools/sliver_tools.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> with TickerProviderStateMixin {
  late ScrollController _controller;

  List<String> data1 = [
    "Bán chạy",
    "Tiếng Anh/Tiếng Việt",
    "Tour ghép",
    "Đón tại điểm hẹn",
    "Thời lượng: 2 giờ"
  ];
  List<String> images = [
    "assets/images/img0.webp",
    "assets/images/img1.webp",
    "assets/images/img2.webp",
    "assets/images/img3.webp",
    "assets/images/img4.webp",
  ];
  bool showSpacing = true;

  final CarouselController _pageController = CarouselController();
  late int currentPage = 0;
  late AnimationController controller;
  late Animation<double> animation, animation2;
  bool determinate = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController(keepScrollOffset: true);
    _controller.addListener(
      () {
        final offset = _controller.offset;
        setState(() {
          if (offset >= 180) {
            showSpacing = false;
          } else {
            showSpacing = true;
          }
        });
      },
    );

    controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    animation2 = Tween(begin: 1.0, end: 1.3).animate(controller);
  }

  @override
  void dispose() {
    controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        controller: _controller,
        slivers: [
          SliverAppBar(
            expandedHeight: 350.0,
            pinned: true,
            automaticallyImplyLeading: false,
            elevation: 0,
            // surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.all(10),
                        transform: Matrix4.identity()
                          ..scale(showSpacing ? 1.0 : 1.3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: showSpacing
                                ? Colors.white
                                : Colors.white.withOpacity(0)),
                        child: Icon(Icons.arrow_back_ios_new_rounded,
                            size: 18, color: Colors.black.withOpacity(0.7)),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      width: showSpacing ? 180 : 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: EdgeInsets.all(10),
                              transform: Matrix4.identity()
                                ..scale(showSpacing ? 1.0 : 1.3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: showSpacing
                                      ? Colors.white
                                      : Colors.white.withOpacity(0)),
                              child: Icon(Icons.mark_unread_chat_alt_rounded,
                                  size: 18,
                                  color: Colors.orange.withOpacity(0.7)),
                            ),
                          ),
                          GestureDetector(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: EdgeInsets.all(10),
                              transform: Matrix4.identity()
                                ..scale(showSpacing ? 1.0 : 1.3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: showSpacing
                                      ? Colors.white
                                      : Colors.white.withOpacity(0)),
                              child: Icon(CupertinoIcons.heart,
                                  size: 18,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                          ),
                          GestureDetector(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: EdgeInsets.all(10),
                              transform: Matrix4.identity()
                                ..scale(showSpacing ? 1.0 : 1.3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: showSpacing
                                      ? Colors.white
                                      : Colors.white.withOpacity(0)),
                              child: Icon(Icons.open_in_new_outlined,
                                  size: 18,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                          ),
                          GestureDetector(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: EdgeInsets.all(10),
                              transform: Matrix4.identity()
                                ..scale(showSpacing ? 1.0 : 1.3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: showSpacing
                                      ? Colors.white
                                      : Colors.white.withOpacity(0)),
                              child: Icon(Icons.shopping_cart_rounded,
                                  size: 18,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Stack(
                children: [
                  CarouselSlider(
                    carouselController: _pageController,
                    items: images.asMap().entries.map((entry) {
                      return ScaleTransition(
                        scale: animation2,
                        alignment: Alignment.center,
                        child: entry.key == 0
                            ? Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.asset(
                                      entry.value,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      // height: 300,
                                    ),
                                  ),
                                  Positioned.fill(
                                      child: Center(
                                    child: GestureDetector(
                                      child: Icon(CupertinoIcons.play_circle,
                                          color: Colors.white, size: 60),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  const VideoPlayerScreen()),
                                        );
                                      },
                                    ),
                                  ))
                                ],
                              )
                            : Image.asset(
                                entry.value,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                // height: 300,
                              ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlayInterval: Duration(milliseconds: 3000),
                      autoPlayAnimationDuration: Duration(microseconds: 1),
                      height: double.maxFinite,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPage = index;
                          controller.reset();
                          controller.forward();
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 30.0,
                    left: 30,
                    right: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: images.asMap().entries.map((entry) {
                        int index = entry.key;
                        return Expanded(
                          child: GestureDetector(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: LinearProgressIndicator(
                                minHeight: 2,
                                value: currentPage > index
                                    ? 1
                                    : currentPage == index
                                        ? animation.value
                                        : 0,
                                borderRadius: BorderRadius.circular(30),
                                backgroundColor: Colors.grey,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Positioned(
                    bottom: 40.0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                      margin: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.image, size: 20, color: Colors.white),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Thư viện ảnh',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: Container(
                height: 20.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0))),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 1000,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                    text:
                        "Du Thuyền Sài Gòn Với Bữa Tối Trên Tàu Saigon Princess",
                    size: 20,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 16,
                      ),
                      SmallText(text: "4.5"),
                      SmallText(text: "(1.05k+ Đánh giá) . 20k+"),
                      SmallText(text: "Đã được đặt")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: data1
                        .map((e) => Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade100),
                            child: SmallText(text: e)))
                        .toList(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.notifications_on,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: SmallText(
                        text:
                            "Lịch trình của tàu sẽ thay đổi thành 19:30-00:30 và chỉ phục vụ ăn tối trong phòng lạnh vào 31 tháng 12 2023",
                        maxLine: 1,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: SmallText(
                        text:
                            "Bến du thuyền trên sống Sài Gòn, 05 Nguyễn Tất Thành, Phường 12, Quận 4, Thành Phố Hồ Chí Minh",
                        maxLine: 1,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SmallText(
                                text: "●",
                                color: Colors.black,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: SmallText(
                                maxLine: 3,
                                size: 16,
                                text:
                                    "Nhập mã  BETTERONAPP - Giảm 5% đến 230.000đ cho KH mới khi thanh toán qua App Klook",
                                color: Colors.black,
                              ))
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmallText(
                                text: "Xem thêm",
                                color: Colors.black,
                                size: 16,
                                decoration: TextDecoration.underline),
                            Icon(
                              CupertinoIcons.hand_thumbsup_fill,
                              size: 30,
                              color: Colors.orange,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 25,
                        width: 8,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: "Các gói dịch vụ",
                        size: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        child: BottomAppBar(
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallText(
                        text: "đ 700,000",
                        color: Colors.black,
                        size: 18,
                        fontWeight: FontWeight.w700),
                    Container(
                        child: SmallText(
                            text: "Credit +37 >",
                            size: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
