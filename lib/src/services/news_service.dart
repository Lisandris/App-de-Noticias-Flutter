import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;



// final _URL_NEWS = 'https://newsapi.org/v2';
final _URL_NEWS = 'newsapi.org';
final _APIKEY = '8f477ae2c4f44526818f65b6b881997f';

class NewsService with ChangeNotifier{


  List<Article> headlines = [];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category( FontAwesomeIcons.building, 'business'),
    Category( FontAwesomeIcons.tv, 'entertainment'),
    Category( FontAwesomeIcons.addressCard, 'general'),
    Category( FontAwesomeIcons.headSideVirus, 'health'),
    Category( FontAwesomeIcons.vials, 'science'),
    Category( FontAwesomeIcons.volleyball, 'sports'),
    Category( FontAwesomeIcons.memory, 'technology'),
 ];

  
  Map<String, List<Article>> categoryArticles = {};



  NewsService(){
    this.getTopHeadlines();

    categories.forEach(( item) { 
      this.categoryArticles[item.name] = [];
    });

  }

  get selectedCategory => this._selectedCategory;
  set setCategory( String valor){
    this._selectedCategory = valor;

    this.getArticlesByCategory( valor );
    notifyListeners();
  }

  List<Article>? get getArticulosCategoriaSeleccionada => this.categoryArticles[ this.selectedCategory ];


  getTopHeadlines() async{
    
    final urlTail ='/v2/top-headlines';
    final Uri uri = Uri.https(
      _URL_NEWS, 
      urlTail, {
        'apiKey': '$_APIKEY',
        'country': 've'
      }
      
    );
    
    final resp = await http.get(uri);

    final newsResponse =  newsResponseFromJson( resp.body );

    this.headlines.addAll( newsResponse.articles );
    notifyListeners();

  }

  getArticlesByCategory(String  category) async {

    if( this.categoryArticles[category]!.length > 0 ) {
      return this.categoryArticles[category];
    }

    final urlTail ='/v2/top-headlines';
    final Uri uri = Uri.https(
      _URL_NEWS, 
      urlTail, {
        'apiKey': '$_APIKEY',
        'country': 've',
        'category': '$category'
      }
      
    );
    
    final resp = await http.get(uri);

    final newsResponse =  newsResponseFromJson( resp.body );

    print('lisa newsResponse: ${ newsResponse.articles.length }');
    
    this.categoryArticles[category]?.addAll(newsResponse.articles);

    notifyListeners();

  }


}