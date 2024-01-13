import 'package:flutter/material.dart';
import 'package:klook/components/small_text.dart';
import 'package:klook/components/title.dart';
import 'package:klook/mocs/data_search.dart';
import 'package:klook/pages/home/app_bar.dart';
import 'package:klook/pages/home/category.dart';
import 'package:klook/pages/home/event_incentives.dart';
import 'package:klook/pages/home/excellence_vent.dart';
import 'package:klook/pages/home/explore_more.dart';
import 'package:klook/pages/home/location.dart';
import 'package:klook/pages/home/recently_viewed.dart';
import 'package:klook/pages/home/service.dart';
import 'package:klook/pages/home/slide_preferential.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with AutomaticKeepAliveClientMixin {
  double _variableValue = 255;
  double _variableValue2 = 0;
  late ScrollController _controller;
  int indexPage = 0;

  double _opacity = 0;
  List<Item> itemList = [
    Item(id: "1", title: "TP Hồ Chí Minh - Tour"),
    Item(id: "2", title: "Tokyo"),
    Item(id: "3", title: "osaka universal"),
    // Thêm các phần tử khác nếu cần
  ];

  List<ItemPreferential> itemPreferential = [
    ItemPreferential(
        urlImage:
            "https://res.klook.com/image/upload/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/yf9jzfbou3qoijdqfcpm.webp",
        id: "1"),
    ItemPreferential(
        urlImage:
            "https://res.klook.com/image/upload/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/rzcfdas2hdtkar2504d2.webp",
        id: "2"),
    ItemPreferential(
        urlImage:
            "https://res.klook.com/image/upload/u_activities:ommxc15f4ivamkuvrnko,h_1.0,ar_960:460,c_scale,e_blur:10000/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/ommxc15f4ivamkuvrnko.webp",
        id: "3"),
    ItemPreferential(
        urlImage:
            "https://res.klook.com/image/upload/u_activities:ibjouw8pflnhjkyk6yr3,h_1.0,ar_960:460,c_scale,e_blur:10000/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/ibjouw8pflnhjkyk6yr3.webp",
        id: "4"),
    ItemPreferential(
        urlImage:
            "https://res.klook.com/image/upload/u_activities:agkfsavp5onhvvk2dxgf,h_1.0,ar_960:460,c_scale,e_blur:10000/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/agkfsavp5onhvvk2dxgf.webp",
        id: "5")
  ];

  List<ItemService> itemServices = [
    ItemService(
        id: "1", title: "Wifi & Thẻ SIM", urlImage: "assets/images/wifi.png"),
    ItemService(
        id: "2", title: "Cáp treo", urlImage: "assets/images/aerial.png"),
    ItemService(
        id: "3",
        title: "Sở thú & Thủy cung",
        urlImage: "assets/images/paw.png"),
    ItemService(
        id: "4", title: "Vé tàu", urlImage: "assets/images/train-ticket.png"),
    ItemService(
        id: "5", title: "Xe sân bay", urlImage: "assets/images/car.png"),
    ItemService(
        id: "6",
        title: "Tàu & Xe buýt sân bay",
        urlImage: "assets/images/bus2.png"),
    ItemService(
        id: "7", title: "Bảo tàng", urlImage: "assets/images/museum.png"),
    // Thêm các phần tử khác nếu cần
  ];
  List<Tour> tours = [
    Tour(
        "1",
        "Vé À Ố Show Ở Nhà Hát Thành Phố Vé À Ố Show Ở Nhà Hát Thành Phố Vé À Ố Show Ở Nhà Hát Thành Phố",
        800000,
        "Tour . Tp Hồ Chí Minh",
        4.8,
        1000,
        500,
        "TP Hồ Chí Minh",
        ["Xác nhận tức thời", "Bán Chạy"],
        "https://res.klook.com/image/upload/u_activities:une1u7uugwcmiqsmkj8e,h_1.0,ar_1160:460,c_scale,e_blur:10000/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/une1u7uugwcmiqsmkj8e.webp",
        "Giảm tối đa 10%",
        true,
        false),
    Tour(
        "1",
        "Tour Ngày Khu Di Tích Địa Đạo Củ Chi & Đồng Bằng Sông Cửu Long từ TP. Hồ Chí Minh",
        1424330,
        "Tour . Tp Hồ Chí Minh",
        4.8,
        1000,
        500,
        "TP Hồ Chí Minh",
        ["Xác nhận tức thời", "Bán Chạy"],
        "https://res.klook.com/image/upload/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/yf9jzfbou3qoijdqfcpm.webp",
        "Giảm tối đa 10%",
        true,
        false),
    Tour(
        "1",
        "Tour Tham Quan Địa Đạo Củ Chi Và Đồng Bằng Sông Cửu Long Bằng Xe Limousine",
        800000,
        "Tour . Tp Hồ Chí Minh",
        4.8,
        1000,
        500,
        "TP Hồ Chí Minh",
        ["Xác nhận tức thời", "Bán Chạy"],
        "https://res.klook.com/image/upload/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/rzcfdas2hdtkar2504d2.webp",
        "Giảm tối đa 10%",
        true,
        false),
    Tour(
        "1",
        "Tour Tham Quan Địa Đạo Củ Chi Và Đồng Bằng Sông Cửu Long Bằng Xe Limousine",
        800000,
        "Tour . Tp Hồ Chí Minh",
        4.8,
        1000,
        500,
        "TP Hồ Chí Minh",
        ["Xác nhận tức thời", "Bán Chạy"],
        "https://res.klook.com/image/upload/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/rzcfdas2hdtkar2504d2.webp",
        "Giảm tối đa 10%",
        true,
        true),
    Tour(
        "1",
        "Du Thuyền Sài Gòn Với Bữa Tối Trên Tàu Saigon Princess",
        800000,
        "Tour . Tp Hồ Chí Minh",
        4.8,
        1000,
        500,
        "TP Hồ Chí Minh",
        ["Xác nhận tức thời", "Bán Chạy"],
        "https://res.klook.com/image/upload/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/fubnzq6m8wq5qtrrkcc5.webp",
        "Giảm tối đa 10%",
        false,
        false),
    Tour(
        "1",
        "Trải Nghiệm Ăn Tối Trên Tàu Indochina Junk và Du Ngoạn Trên Sông Sài Gòn",
        800000,
        "Tour . Tp Hồ Chí Minh",
        4.8,
        1000,
        500,
        "TP Hồ Chí Minh",
        ["Xác nhận tức thời", "Bán Chạy"],
        "https://res.klook.com/image/upload/u_activities:agkfsavp5onhvvk2dxgf,h_1.0,ar_960:460,c_scale,e_blur:10000/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/agkfsavp5onhvvk2dxgf.webp",
        "Giảm tối đa 10%",
        true,
        false),
    Tour(
        "1",
        "Vé xe Limousine đi Đà Lạt từ TP Hồ Chí Minh và ngược lại",
        800000,
        "Tour . Tp Hồ Chí Minh",
        4.8,
        1000,
        500,
        "TP Hồ Chí Minh",
        ["Xác nhận tức thời", "Bán Chạy"],
        "https://res.klook.com/image/upload/u_activities:ibjouw8pflnhjkyk6yr3,h_1.0,ar_960:460,c_scale,e_blur:10000/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/ibjouw8pflnhjkyk6yr3.webp",
        "Giảm tối đa 10%",
        true,
        false),
    Tour(
        "1",
        "Vé Xe Giường Nằm Đi Phan Thiết/Mũi Né (KH Từ TP. Hồ Chí Minh)",
        800000,
        "Tour . Tp Hồ Chí Minh",
        4.8,
        1000,
        500,
        "TP Hồ Chí Minh",
        ["Xác nhận tức thời", "Bán Chạy"],
        "https://res.klook.com/image/upload/u_activities:ommxc15f4ivamkuvrnko,h_1.0,ar_960:460,c_scale,e_blur:10000/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/ommxc15f4ivamkuvrnko.webp",
        "Giảm tối đa 10%",
        true,
        true),
  ];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_listener);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _listener() {
    final offset = _controller.offset;
    setState(() {
      _opacity = (offset / 50);
      if (_opacity > 1) _opacity = 1;
      _variableValue = (1 - _opacity) * 255;
      _variableValue2 = _opacity * 188;
      if (_controller.position.pixels  == _controller.position.maxScrollExtent) {
        _isLoading = true;
        fetch();
      }
    });

  }

  void fetch() async {
    // await Future.delayed(Duration(seconds: 3));
    setState(() {
      tours.add(
        Tour(
            "1",
            "Du Thuyền Sài Gòn Với Bữa Tối Trên Tàu Saigon Princess",
            800000,
            "Tour . Tp Hồ Chí Minh",
            4.8,
            1000,
            500,
            "TP Hồ Chí Minh",
            ["Xác nhận tức thời", "Bán Chạy"],
            "https://res.klook.com/image/upload/c_fill,w_1265,h_712/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/fubnzq6m8wq5qtrrkcc5.webp",
            "Giảm tối đa 10%",
            false,
            false),
      );
    });

    _isLoading = false;
  }

  Widget get _mainContent {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.4),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 220,
                    child: SmallText(
                      text: "Chia sẻ vị trí để nhận gợi ý và ưu đãi phù hợp",
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        // Xử lý sự kiện khi nút được nhấn
                      },
                      child: const SmallText(
                        text: "Chia sẻ vị trí",
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Category
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: const Category()),
            const SizedBox(
              height: 15,
            ),
            // Service
            Container(
                margin: const EdgeInsets.only(left: 15, right: 5),
                child: ServiceHome(itemServices)),
            const SizedBox(
              height: 15,
            ),
            TitleHome(text: "Xem gần đây"),
            const SizedBox(
              height: 15,
            ),
            Container(
                margin: const EdgeInsets.only(left: 10),
                child: RecentlyViewed(tours)),
            const SizedBox(
              height: 15,
            ),
            TitleHome(
              text: "Ưu đãi du lịch hấp dẫn",
              showDetail: false,
            ),
            const SizedBox(
              height: 15,
            ),
            // Ưu đãi
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 250,
              child: Row(
                children: [
                  SlidePreferential(itemPreferential: itemPreferential),
                  const EventIncentives(),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TitleHome(
              text: "Bạn muốn đi chơi ở đâu",
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                margin: const EdgeInsets.only(left: 10),
                child: Location(tours)),
            const SizedBox(
              height: 30,
            ),
            TitleHome(
              text: "Các hoạt động nổi bật",
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                margin: const EdgeInsets.only(left: 10),
                child: ExcellenceEvent(tours)),
            const SizedBox(
              height: 15,
            ),
            TitleHome(
              text: "Khám phá thêm",
              showDetail: false,
            ),
          ]),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: DefaultTabController(
          length: 5,
          child: NestedScrollView(
            controller: _controller,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverStack(
                  children: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 250,
                        child: Image.network(
                          'https://hepvo.com/wp-content/uploads/2019/02/radial-gradient-background.png',
                          // Thay đổi URL thành đường dẫn thực tế của hình ảnh bạn muốn hiển thị
                          fit: BoxFit.cover, // Chọn fit theo nhu cầu của bạn
                        ),
                      ),
                    ),
                    MultiSliver(
                      children: [
                        AppBarHome(_variableValue, _variableValue2, _opacity,
                            itemList),
                        SliverToBoxAdapter(
                          child: _mainContent,
                        ),
                        MultiSliver(
                          children: [
                            SliverPinnedHeader(
                              child: Container(
                                color: Colors.white,
                                child: TabBar(
                                  tabAlignment: TabAlignment.start,
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  labelStyle: const TextStyle(
                                      color: Colors.orangeAccent,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Roboto",
                                      fontSize: 16),
                                  indicatorColor: Colors.orangeAccent,
                                  isScrollable: true,
                                  unselectedLabelStyle: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Roboto",
                                      fontSize: 16),
                                  dividerColor: Colors.white,
                                  tabs: const [
                                    Tab(child: Text("Đề xuất")),
                                    Tab(child: Text("Gần đây")),
                                    Tab(child: Text("Du lịch nước ngoài")),
                                    Tab(child: Text("Không nên bỏ lỡ")),
                                    Tab(child: Text("Chỗ ở tiện nghi")),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ];
            },
            body: TabBarView(children: [
              ExploreMore(
                tours: tours,
                isLoading: _isLoading,
                fetch: fetch,
              ),
              ExploreMore(
                tours: tours,
                isLoading: _isLoading,
                fetch: fetch,
              ),
              ExploreMore(
                tours: tours,
                isLoading: _isLoading,
                fetch: fetch,
              ),
              ExploreMore(
                tours: tours,
                isLoading: _isLoading,
                fetch: fetch,
              ),
              ExploreMore(
                tours: tours,
                isLoading: _isLoading,
                fetch: fetch,
              ),
            ]),
          ),
        )

        // CustomScrollView(
        //   controller: _controller,
        //   slivers: [
        //
        //   ],
        // ),
        );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
