import 'package:app1/data/news_repository.dart';
import 'package:app1/util/styles.dart';
import 'package:app1/view/widgets/news_card.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'BIT News',
          style: TextStyle(color: Colors.black26),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.favorite),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Image.network(
                  'https://bit.institute/images/Instituto-Cursos-Programacion.png'),
            )),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Text(
                '> All articles about Bitcoin from the last month, sorted by recent first',
                style: Styles.drawerOptionStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Text(
                '> All articles about Bitcoin from the last month, sorted by recent first',
                style: Styles.drawerOptionStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Text(
                '> All articles about Bitcoin from the last month, sorted by recent first',
                style: Styles.drawerOptionStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Text(
                '> All articles about Bitcoin from the last month, sorted by recent first',
                style: Styles.drawerOptionStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Text(
                '> All articles about Bitcoin from the last month, sorted by recent first',
                style: Styles.drawerOptionStyle,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: NewsRepository()
            .NEWS
            .map((news) => NewsCard(
                  news: news,
                ))
            .toList(),
      ),
    );
  }
}
