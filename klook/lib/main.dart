import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klook/components/video_custom.dart';
import 'package:klook/pages/detail/detail.dart';
import 'package:klook/pages/home/HomePage.dart';
import 'package:klook/pages/home/detail.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Floating App Bar';

    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: Colors.white),
      ),
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Detail(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

          // VideoPlayerScreen(
          //     videoUrl:
          //         "https://res.klook.com/video/upload/fl_lossy.progressive,q_85,f_auto/c_fill,,/c_scale,h_540,vc_auto/c_scale,g_north_west,h_20,l_Klook_water_br_trans_yhcmh3,o_30,x_70,y_480/c_scale,f_mp4,fl_splice,h_540,l_video:ending_video_esl1b1/v1667877567/activities/pi9ahhooi63them0abf1.mp4"),

          Center(

        child: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        unselectedLabelStyle: const TextStyle(
            fontSize: 11, fontFamily: "Roboto", fontWeight: FontWeight.w400),
        selectedLabelStyle: const TextStyle(
            fontSize: 11, fontFamily: "Roboto", fontWeight: FontWeight.w700),
        iconSize: 20,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/icon_active_home.png")),
            activeIcon: ImageIcon(AssetImage("assets/images/icon_home.png")),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/icon_coupon.png")),
            activeIcon: ImageIcon(AssetImage("assets/images/icon_coupon.png")),
            label: 'Ưu đãi',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            activeIcon: Icon(CupertinoIcons.heart_fill),
            label: 'Yêu thích',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/icon_luggage.png")),
            activeIcon: ImageIcon(AssetImage("assets/images/icon_luggage.png")),
            label: 'Chuyến đi',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/icon_tasty.png")),
            activeIcon: ImageIcon(AssetImage("assets/images/icon_emoji.png")),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
