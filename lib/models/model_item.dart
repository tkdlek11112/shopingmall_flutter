import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  late String id;
  late String title;
  late String brand;
  late String description;
  late String imageUrl;
  late String registerDate;
  late int price;

  Item({
    required this.id,
    required this.title,
    required this.brand,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.registerDate,
  });

  Item.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    id = snapshot.id;
    title = data['title'];
    brand = data['brand'];
    description = data['description'];
    imageUrl = data['imageUrl'];
    price = data['price'];
    registerDate = data['registerDate'];
  }

  Item.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    brand = data['brand'];
    description = data['description'];
    imageUrl = data['imageUrl'];
    price = data['price'];
    registerDate = data['registerDate'];
  }

  Map<String, dynamic> toSnapshot() {
    return {
      'id': id,
      'title': title,
      'brand': brand,
      'description': description,
      'imageUrl':imageUrl,
      'price':price,
      'registerDate':registerDate
    };
  }
}
