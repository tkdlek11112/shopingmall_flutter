import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopingmall_flutter/models/model_item_provider.dart';
import 'package:shopingmall_flutter/models/model_query.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    final queryProvider = Provider.of<QueryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            TextField(
              onChanged: (text) {
                queryProvider.updateText(text);
              },
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'search keyword',
                border: InputBorder.none,
              ),
              cursorColor: Colors.grey,
            )
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {
                itemProvider.search(queryProvider.text);
              },
              icon: Icon(Icons.search_rounded))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.5,
                  ),
                  itemCount: itemProvider.searchItem.length,
                  itemBuilder: (context, index) {
                    return GridTile(
                        child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: itemProvider.searchItem[index]);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(itemProvider.searchItem[index].imageUrl),
                            Text(
                              itemProvider.searchItem[index].title,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              itemProvider.searchItem[index].price.toString() + '원',
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    ));
                  }))
        ],
      ),
    );
  }
}
