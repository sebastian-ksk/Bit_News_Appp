import 'package:app1/models/news.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//==============================CARDS DE NOTICIAS===============================
class NewsCard extends StatelessWidget {
  final News news;
  NewsCard({Key key, @required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: MediaQuery.of(context).size.height / 1.72,
      margin: EdgeInsets.only(top: 15),
      //===================DECORACION DEL CONTENEDOR ===========================
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            //sombreado
            BoxShadow(blurRadius: 2, spreadRadius: 2, color: Colors.black12)
          ]),
      //========================================================================
      child: Column(
        children: [
          //====================CARDS DE NOTICIAS===============================
          //====================IMAGEN DE LA NOTICIA============================
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: news.urlToImage != null
                        ? NetworkImage(news.urlToImage)
                        : AssetImage('assets/img/backbit.png'))),
          ),
          //====================================================================
          //============================ CAJA DE TEXTO =========================
          Flexible(
            //para que los textos no se limiten a los margenes
            child: Container(
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, //alineacion central
                children: [
                  //=================== TITULO DE LA NOTICIA ====================
                  Text(news.title ?? 'Title not find',
                      maxLines: 3, //maximo de lineas
                      style: GoogleFonts.signika(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  // ===================AUTOR DEL ARTICULO =====================
                  Text(news.author ?? 'Author not find',
                      style: GoogleFonts.signika(
                          fontSize: 14,
                          color: Colors.black45,
                          fontWeight: FontWeight.normal)),
                  // ===========================================================
                  Container(
                    height: 10,
                  ),
                  // =================== DESCRIPCION DEL TEXTO =================
                  Text(news.description ?? 'Description not find',
                      maxLines: 3,
                      style: GoogleFonts.signika(
                          fontSize: 12,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal)),
                  // ===========================================================
                ],
              ),
            ),
          ),
          //====================================================================
          //==============CONTENEDOR DE FAVORITOS Y LECTURA COMPLETA ===========
          Container(
            margin: EdgeInsets.only(right: 13, left: 13), //mergen interna
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //===================ICONO DE CORAZON ========================
                  IconButton(
                      icon: Icon(Icons.favorite_border_outlined),
                      onPressed: () {
                        print("favorito");
                      }),
                  //============================================================
                  //===================BOTON DE VER MAS ========================
                  InkWell(
                    //le da gestos a todo widget
                    onTap: () {
                      print("ver mas ...");
                    },
                    child: Text(
                      'MORE>',
                      style: GoogleFonts.signika(
                          fontSize: 14,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                  // ===========================================================
                ],
              ),
            ),
          )
          // ===================================================================
        ],
      ),
    );
  }
}
