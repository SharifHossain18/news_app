import 'package:flutter/material.dart';
import 'package:news_app/Pages/all_news.dart';
import 'package:news_app/Pages/breaking_news.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.8),
        centerTitle: true,
        title: Text("News App"),
        bottom: TabBar(
            tabs: [
              Tab(text: "Breaking News",),
              Tab(text: "All News",)
            ]),
      ),
      body: TabBarView(
          children: [
            BreakingNews(),
            AllNewsPage(),

          ]),
    ));
  }
}
