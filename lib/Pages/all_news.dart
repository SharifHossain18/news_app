import 'package:flutter/material.dart';

import '../Model/news_model.dart';
import '../Services/api_service.dart';
import '../components/news_item_list.dart';
class AllNewsPage extends StatelessWidget {
  const AllNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices=ApiServices();
    return Scaffold(
      body: FutureBuilder(
          future: apiServices.getAllNews(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              List<NewsModel> articlesList=snapshot.data??[];
              return ListView.builder(
                  itemCount: articlesList.length,
                  itemBuilder: (context,index){
                    return NewsItemList(newsModel: articlesList[index]);
                  });
            }
            return Center(child: CircularProgressIndicator(),);
          }),
    );
  }
}
