//=========MODELOS DE LA APLICACION PARA VISUALIZACION DE NOTICIAS==============

//==================MODELO DE LA RESPUESTA API-REST JSON =======================
class NewsApiModel {
  String status; //staus de pagina
  int totalResults; //total de resultados
  List<News> articlesList; //lista tipo News() abajo

  NewsApiModel(this.status, this.totalResults, this.articlesList); //constructor

  NewsApiModel.fromjson(Map<String, dynamic> map) {
    //clase desde el json
    var mapArticles = map['articles'] as List;
    status = map['status'];
    totalResults = map['totalResults'];
    articlesList = mapArticles.map((json) => News.fromjson(json)).toList();
  }
}

class News {
  //======================PROPIEDADES DE CADA NOTICIA===========================
  Source source;
  String urlToImage;
  String title;
  String url;
  String author;
  String publishedAt;
  String content;
  String description;
  //============================================================================
  //==============================CONSTRUCTOR DEL METODO========================
  News(
      {this.source,
      this.urlToImage,
      this.title,
      this.url,
      this.author,
      this.publishedAt,
      this.content,
      this.description});
  //===========================================================================
  News.fromjson(Map<String, dynamic> map) {
    source = Source.fromjson(map['source']);
    author = map['author'];
    title = map['title'];
    description = map['description'];
    url = map['url'];
    urlToImage = map['urlToImage'];
    publishedAt = map['publishedAt'];
    content = map['content'];
  }
}

class Source {
  String id;
  String name;

  Source(this.id, this.name);

  Source.fromjson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}
