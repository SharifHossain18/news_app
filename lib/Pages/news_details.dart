
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  final NewsModel newsModel;
  const NewsDetails({super.key,
  required this.newsModel
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(newsModel.title.toString()),),
      body: Padding(
          padding: EdgeInsets.all(8),
      child: Column(
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
          Text(newsModel.title.toString()),
          SizedBox(height: 5,),
          Text(newsModel!.description.toString()),
          SizedBox(height: 8,),
          ElevatedButton(
              onPressed: () async{
                    final Uri uri=Uri.parse(newsModel.url.toString());
                    if(!await launchUrl(uri)){
                      throw Exception("Could not launch");

                    }
              },
              child: Text("Read More"))
        ],
      ),
      )
    );
  }
}
