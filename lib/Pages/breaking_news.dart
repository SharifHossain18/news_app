import 'package:flutter/material.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:news_app/Services/api_service.dart';
import '../components/news_item_list.dart';
class BreakingNews extends StatelessWidget {
  const BreakingNews({super.key});

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices=ApiServices();
    return Scaffold(
      body: FutureBuilder(
          future: apiServices.getBreakingNews(),
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
