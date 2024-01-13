class Item {
  String title;
  String id;

  Item({required this.title, required this.id});
}

class ItemService {
  String title;
  String urlImage;
  String id;

  ItemService({required this.title, required this.id, required this.urlImage});
}

class ItemPreferential {
  String urlImage;
  String id;

  ItemPreferential({required this.urlImage, required this.id});
}

class Tour {
  String id;
  String title;
  double price;
  String type;
  double rate;
  int numberRate;
  int orderedQuantity;
  String location;
  String urlImage;
  String support;
  List services;
  bool suggest;
  bool isTotal ;


  Tour(this.id, this.title, this.price, this.type, this.rate, this.numberRate,
      this.orderedQuantity, this.location, this.services, this.urlImage,this.support,this.suggest, this.isTotal);
}
