import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:news_app/Pages/news_details.dart';
class NewsItemList extends StatelessWidget {
  final NewsModel newsModel;
  const NewsItemList({super.key,
  required this.newsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(NewsDetails(newsModel: newsModel));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: newsModel.urlToImage.toString(),
              placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                    child: Text(newsModel!.source!.name!.toString()),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30)
                ),
                ),
                SizedBox(width: 8,),
                Text(newsModel.publishedAt.toString())
              ],
            ),
            Text(newsModel.author==null ?"": "Written by: ${newsModel.author.toString()}"),
            SizedBox(height: 8,),
            Text(newsModel.title.toString())
          ],

        ),
      ),
    );
  }
}
