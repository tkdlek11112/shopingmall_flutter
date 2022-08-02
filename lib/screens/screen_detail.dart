

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopingmall_flutter/models/model_cart.dart';

import '../models/model_item.dart';

class DetailScreen extends StatelessWidget {
  late String uid = '';

  Future<void> getUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('uid') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    final cartProvider = Provider.of<CartProvider>(context);
    getUid();

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Container(
        child: ListView(
          children: [
            Image.network(item.imageUrl),
            Padding(padding: EdgeInsets.all(4)),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(10),
              child: Text(
                item.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.price.toString() + '원',
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                      Text(
                        '브랜드 : ' + item.brand,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '등록일 : ' + item.registerDate,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  cartProvider.isCartItemIn(item) ? Icon(Icons.check, color: Colors.blue)
                  : InkWell(
                    onTap: () {
                      print(uid);
                      cartProvider.addCartItem(uid, item);
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                        Text(
                          'add cart',
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text(item.description, style: TextStyle(fontSize: 16),),
            )
          ],
        ),
      ),
    );
  }
}