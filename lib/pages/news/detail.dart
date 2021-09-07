import 'package:flutter/material.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail({Key? key}) : super(key: key);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('新闻详情'),
    );
  }
}
