import 'package:flutter/material.dart';

class DetailHotelScreen extends StatefulWidget {
  const DetailHotelScreen({super.key});

  @override
  State<DetailHotelScreen> createState() => _DetailHotelScreenState();
}

class _DetailHotelScreenState extends State<DetailHotelScreen> {
  double _scrollPosition = 0;

  // final CarouselController _controller = CarouselController();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(

              leading: Container(
                margin: const EdgeInsets.only(left: 5),
                child: const Icon(Icons.arrow_back_ios)
              ),
              actions: <Widget>[
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _scrollPosition < 101
                            ? Colors.black
                            : Colors.transparent,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.message, color: Colors.orange),
                        onPressed: () {},
                      ),
                    ),
                    const Icon(Icons.open_in_new),
                    const Icon(Icons.favorite_border),
                    const Icon(Icons.help_outline),
                  ],
                )
              ],
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              floating: false,
              snap: false,
              pinned: true,
              centerTitle: false,
              stretch: true,
            ),

            SliverToBoxAdapter(
              child: Container(
                height: 1000,
                color: Colors.yellow,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 1000,
                color: Colors.red,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 1000,
                color: Colors.orangeAccent,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 1000,
                color: Colors.lightBlueAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> evaluteCardData = [
  {
    'customerName': 'Felecia',
    'date': '27/7/2023',
    'rating': 5.0,
    'category': 'Gia đình - vui chơi',
    'reviewContent':
        'Excellent hotel- amenities,  breakfast buffet,  massage,  majority of the staff.  Unfortunately,  I  encountered a horrible experience at the Chinese restaurant inside the hotel. The staff at that particular restaurant was rude, inconsiderate and unprofessional. However, overall this hotel is definitely a 5 star and the staff is 4 star due to my encounter at the Chinese restaurant.',
  },
  {
    'customerName': 'John Doe',
    'date': '28/7/2023',
    'rating': 4.5,
    'category': 'Business Trip',
    'reviewContent':
        'Great stay, excellent service. The staff was very helpful and the facilities were top-notch. Highly recommend for business travelers.',
  },
  {
    'customerName': 'Alice',
    'date': '29/7/2023',
    'rating': 4.8,
    'category': 'Solo Travel',
    'reviewContent':
        'Had a wonderful solo trip. The location was perfect, and the amenities provided by the hotel were outstanding. Will definitely come back.',
  },
  {
    'customerName': 'Bob',
    'date': '30/7/2023',
    'rating': 3.5,
    'category': 'Adventure',
    'reviewContent':
        'The hotel was okay, but there were a few issues with cleanliness. The staff was friendly, and the surrounding area had good places to explore.',
  },
  {
    'customerName': 'Eva',
    'date': '31/7/2023',
    'rating': 4.2,
    'category': 'Family Vacation',
    'reviewContent':
        'Enjoyed a family vacation at this hotel. The atmosphere was pleasant, and the staff took good care of us. However, the rooms could use some improvement.',
  },
];
final List<String> imageUrls = [
  'img/img_hotel1.jpeg',
  'img/img_hotel2.jpeg',
  'img/img_hotel3.jpeg',
  'img/img_hotel4.jpeg',
  'img/img_hotel5.jpeg',
];
final List<Map<String, String>> locations = [
  {'name': 'Chùa Vĩnh Nghiêm', 'distance': '400m'},
  {
    'name': 'Đại học Sư phạm Thành phố Hồ Chí Minh- Cơ sở 2',
    'distance': '600m'
  },
  {'name': 'Chợ Tân Định', 'distance': '500m'},
];
final List<Map<String, dynamic>> tilities = [
  {'id': '1', 'item': 'Wifi miễn phí', 'icon': Icons.wifi},
  {'id': '2', 'item': 'Trung tâm thể hình', 'icon': Icons.fitness_center},
  {
    'id': '3',
    'item': 'Đón và trả khách trạm tàu hoà/xe buuýt, sân bay(có phụ phí)',
    'icon': Icons.airport_shuttle,
  },
];
final List<Map<String, dynamic>> infrastructure = [
  {'id': '1', 'item': 'Bãi đỗ xe', 'icon': Icons.check_circle_outline},
  {
    'id': '2',
    'item': 'Khu vực hút thuốc được chỉ định',
    'icon': Icons.check_circle_outline
  },
  {
    'id': '3',
    'item': 'Thang máy',
    'icon': Icons.check_circle_outline,
  },
  {
    'id': '4',
    'item': 'Dịch vụ cưới',
    'icon': Icons.check_circle_outline,
  },
  {
    'id': '5',
    'item': 'Trung tâm thương mại',
    'icon': Icons.check_circle_outline,
  },
];
final List<Map<String, dynamic>> dataCustomNearbyPlaceCard = [
  {
    'imagePath': 'img/img_hotel1.jpeg',
    'hotelName': 'Khách sạn hoa công 1',
    'rating': 4.0,
    'ratingStatus': '4.7/5',
    'price': '\$80',
  },
  {
    'imagePath': 'img/img_hotel2.jpeg',
    'hotelName': 'Khách sạn hoa công 2',
    'rating': 3.5,
    'ratingStatus': '3.5/5',
    'price': '\$65',
  },
  {
    'imagePath': 'img/img_hotel3.jpeg',
    'hotelName': 'Khách sạn hoa công 3',
    'rating': 4.2,
    'ratingStatus': '4.2/5',
    'price': '\$90',
  },
  {
    'imagePath': 'img/img_hotel4.jpeg',
    'hotelName': 'Khách sạn hoa công 4',
    'rating': 4.8,
    'ratingStatus': '4.8/5',
    'price': '\$120',
  },
  {
    'imagePath': 'img/img_hotel5.jpeg',
    'hotelName': 'Khách sạn hoa công 5',
    'rating': 3.9,
    'ratingStatus': '3.9/5',
    'price': '\$75',
  },
];
