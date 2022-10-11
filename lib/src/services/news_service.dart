import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;



// final _URL_NEWS = 'https://newsapi.org/v2';
final _URL_NEWS = 'newsapi.org';
final _APIKEY = '8f477ae2c4f44526818f65b6b881997f';

class NewsService with ChangeNotifier{


  List<Article> headlines = [];

  NewsService(){


    this.getTopHeadlines(); 
  }


  getTopHeadlines() async{
    
    final urlTail ='/v2/top-headlines?apiKey=$_APIKEY&country=ve';
    final Uri uri = Uri.https(_URL_NEWS, urlTail);
    
    final resp = await http.get(uri);

    final newsResponse =  newsResponseFromJson( resp.body );

    this.headlines.addAll( newsResponse.articles );
    notifyListeners();

  }
}