import 'package:app1/data/apiService.dart';
import 'package:app1/presenter/build_itemList.dart';
import 'package:flutter/material.dart';

class BuildView extends StatelessWidget {
  final String viewName;
  final int intNews;

  BuildView({@required this.viewName, @required this.intNews});

  @override
  Widget build(BuildContext context) {
    switch (viewName) {
      case 'NewsList':
        return Container(
          child: Center(
            child: Container(
              child: FutureBuilder(
                  //future es para expereincia de usuario

                  future: ApiService().GetDio(optionUrl: intNews),
                  builder: (context, snapshot) {
                    //el constructor trae un snapshot
                    if (snapshot.hasData) {
                      //si se retorno algo
                      return ListView.builder(
                        itemCount: (snapshot.data)
                            .articlesList
                            .length, //numero de items en al alista
                        itemBuilder: (BuildContext context, int index) {
                          //un index por cada articulo
                          // por cada item construye una tarjeta
                          return buildItemList(
                              snapshotData:
                                  (snapshot.data).articlesList[index]);
                        },
                      );
                      //si no se retorna un error de adqusiscion
                    } else if (snapshot.hasError) {
                      return Container();
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ),
        );
      case 'FavoriteList':
        return Container();
    }
  }
}
