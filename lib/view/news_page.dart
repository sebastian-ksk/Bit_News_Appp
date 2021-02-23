import 'package:app1/data/news_repository.dart';
import 'package:app1/presenter/build_view.dart';
import 'package:app1/util/styles.dart';
import 'package:app1/view/widgets/news_card.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int Newsint = 1;

  String viewName = 'NewsList';

  Widget _selector_News(String tittle, int intNew) {
    return InkWell(
      onTap: () {
        setState(() {
          Newsint = intNew;
          viewName = 'NewsList';
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Text(
          tittle,
          style: Styles.drawerOptionStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //======================Barra superior de noticias========================
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
      //========================================================================
      //=====================Barra lateral de navegacion========================
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
            //===============TESLA ARTICULOS ==================================
            _selector_News(
                '> All articles about Tesla from the last month, sorted by recent first',
                1),
            //==================================================================
            // ==================ARTICULOS DE NEGOCIOS =========================
            _selector_News(
              '> Top business headlines in the US right now',
              2,
            ),
            // =================================================================
            //=========================APPLE ARTICULOS =========================
            _selector_News(
              '> All articles mentioning Apple from yesterday, sorted by popular publishers first',
              3,
            ),
            // =================================================================
            //========================TECH ARTICULOS ===========================
            _selector_News(
              '> Top headlines from TechCrunch right now',
              4,
            ),
            //==================================================================
            //========================WALL STREE ARTICULOS =====================
            _selector_News(
              'All articles published by the Wall Street Journal in the last 6 months, sorted by recent first',
              5,
            ),
            //==================================================================
          ],
        ),
      ),
      //========================================================================

      body: Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        //llamado a recontructor de vista
        child: BuildView(viewName: viewName, intNews: Newsint),
      ),
    );
  }
}
