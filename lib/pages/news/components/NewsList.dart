import 'package:flutter/material.dart';

class NewsListComponent extends StatefulWidget {
  final List list;
  const NewsListComponent({Key? key, required this.list}) : super(key: key);

  @override
  _NewsListComponentState createState() => _NewsListComponentState();
}

class _NewsListComponentState extends State<NewsListComponent> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          var news = widget.list[index];
          return GestureDetector(
            onTap: () {
              print(index);
            },
            child: Container(
              color: Colors.white,
              child: Text(news['title']),
            ),
          );
        },
        childCount: widget.list.length,
      ),
    );
  }
}
