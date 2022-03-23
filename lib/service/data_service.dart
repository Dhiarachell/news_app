import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/articles.dart';

String apiKey = 'b4bc763d58ed4641896100dc7992db11';
String baseUrl = 'https://newsapi.org/v2/top-headlines';

class News{
  Future<List<Article>?> getNews() async{
    List<Article>? list;
    String url = '$baseUrl?country=us&apiKey=$apiKey' ;
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data['articles'] as List ;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;

    }else {
      throw Exception("Error can't acces this web");
    }
  }
  Future<List<Article>?> getNewsByCategory(String category) async{
    List<Article>? list;
    String url = '$baseUrl?country=us&apiKey=$apiKey&category=$category' ;
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data['articles'] as List ;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;

    }else {
      throw Exception("Error can't acces this web");
    }
  }

}