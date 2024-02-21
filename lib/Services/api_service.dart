
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Model/news_model.dart';

class ApiServices{

  final all_news_url="https://newsapi.org/v2/everything?q=bitcoin&apiKey=3eae146e0c544a93826ffefcf2344a77";
  final breaking_news_url="https://newsapi.org/v2/top-headlines?country=us&apiKey=3eae146e0c544a93826ffefcf2344a77";


  Future<List<NewsModel>> getAllNews() async{
    try{
      http.Response response=await http.get(Uri.parse(all_news_url));
      if(response.statusCode==200){
        Map<String, dynamic> json=jsonDecode(response.body);
        List<dynamic> body=json['articles'];
        List<NewsModel> articlesList=body.map((e) => NewsModel.fromJson(e)).toList();
        return articlesList;
      }
      else{
        throw ("No news found");
      }

    }
    catch(e){
      throw e.toString();
    }

  }

  Future<List<NewsModel>> getBreakingNews() async{
    try{
      http.Response response=await http.get(Uri.parse(breaking_news_url));
      if(response.statusCode==200){
        Map<String, dynamic> json=jsonDecode(response.body);
        List<dynamic> body=json['articles'];
        List<NewsModel> articlesList=body.map((e) => NewsModel.fromJson(e)).toList();
        return articlesList;
      }
      else{
        throw ("No news found");
      }

    }
    catch(e){
      throw e.toString();
    }

  }


}