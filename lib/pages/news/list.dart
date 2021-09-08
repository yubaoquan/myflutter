import 'package:flutter/material.dart';
import '../../utils/Global.dart';
import 'components/NewsList.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List newsList = [];

  @override
  void initState() {
    G.api.news.newsList(type: 'top').then((newsListResp) {
      print(newsListResp['result']['data']);
      setState(() {
        newsList = newsListResp['result']['data'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(5),
            sliver: NewsListComponent(list: newsList),
          )
        ],
      ),
    );
  }
}
