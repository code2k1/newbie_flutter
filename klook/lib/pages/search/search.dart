import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klook/components/small_text.dart';
import 'package:sliver_tools/sliver_tools.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool showListSearch = false;
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataSearch = ModalRoute.of(context)!.settings.arguments;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: !showListSearch
            ? CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    pinned: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: const Icon(Icons.arrow_back_ios_rounded,
                              color: Colors.black45, size: 20),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 35,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                width: 1.2,
                                color: Colors.red,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    autofocus: true,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w500),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8),
                                      hintText: dataSearch.toString(),
                                      isDense: true,
                                    ),
                                    cursorColor: Colors.redAccent,
                                  ),
                                ),
                                CupertinoButton(
                                  borderRadius: BorderRadius.circular(50),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  color: Colors.redAccent,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(Icons.search_rounded),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(
                                text: "Lịch sử tìm kiếm",
                                size: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.8),
                              ),
                              const Icon(Icons.delete_forever_rounded)
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.black45.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const SmallText(
                              text: "da nang",
                              size: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SmallText(
                            text: "Phổ biến nhất",
                            size: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: [
                              "sim thai lan",
                              "da nang",
                              "seoul",
                              "sim thailand",
                              "bali",
                              "anmon resort bintan",
                              "sim dai loan",
                              "sapa",
                              "ho chi minh"
                            ].map((data) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.black45.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: SmallText(
                                  text: data,
                                  size: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DefaultTabController(
                      length: 4,
                      child: MultiSliver(
                        children: [
                          SliverPinnedHeader(
                            child: Container(
                              color: Colors.white,
                              child: TabBar(
                                tabAlignment: TabAlignment.start,
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                labelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Roboto",
                                    fontSize: 14),
                                indicator: UnderlineTabIndicator(
                                    borderSide: BorderSide(
                                        width: 4.0, color: Colors.redAccent,
                                        ),
                                  borderRadius: BorderRadius.circular(100)
                                    ),
                                isScrollable: true,

                                unselectedLabelStyle: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto",
                                    fontSize: 14),
                                dividerColor: Colors.white,
                                tabs: const [
                                  Tab(child: Text("Top tìm kiếm")),
                                  Tab(child: Text("Điểm đến theo xu hướng")),
                                  Tab(
                                      child:
                                          Text("Top điểm tham quan lân cận")),
                                  Tab(child: Text("Mới nhất")),
                                ],
                              ),
                            ),
                          ),
                          SliverFillRemaining(
                            child: TabBarView(
                                viewportFraction: 0.7,
                                children: [
                              Stack(
                                children:[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index) {
                                        return Text(index.toString());
                                      },
                                      itemCount: 100,
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.pinkAccent.withOpacity(0.5),
                                          Colors.yellowAccent.withOpacity(0.55),
                                          Colors.red.withOpacity(0.65),
                                          Colors.deepPurpleAccent.withOpacity(0.75),
                                          Colors.greenAccent.withOpacity(0.85),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.topRight,
                                        // stops: [0, 0.1, 0.2, 0.3, 0.4],
                                      ),
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                                    ),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index) {
                                        return Text(index.toString());
                                      },
                                      itemCount: 100,
                                    ),
                                  ),
                                ]
                              ),
                                  Container(
                                    color: Colors.pinkAccent,
                                    margin: EdgeInsets.only(left: 20),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index) {
                                        return Text(index.toString());
                                      },
                                      itemCount: 100,
                                    ),
                                  ),
                                  Container(
                                    color: Colors.greenAccent,
                                    margin: EdgeInsets.only(left: 20),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index) {
                                        return Text(index.toString());
                                      },
                                      itemCount: 100,
                                    ),
                                  ),
                                  Container(
                                    color: Colors.yellow,
                                    margin: EdgeInsets.only(left: 20),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index) {
                                        return Text(index.toString());
                                      },
                                      itemCount: 100,
                                    ),
                                  ),
                            ]),
                          ),
                        ],
                      ))
                ],
              )
            : Container(),
      ),
    );
  }
}
