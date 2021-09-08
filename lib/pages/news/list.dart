import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../utils/Global.dart';
import 'components/NewsList.dart';
import '../../providers/CategoryProvider.dart';
import 'package:provider/provider.dart';

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
      setState(() {
        newsList = newsListResp['result']['data'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Category> categories = context.watch<CategoryProvider>().categories;
    String activeCategoryId =
        context.watch<CategoryProvider>().activeCategoryId;

    return Column(
      children: [
        Container(
          height: 30,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: categories.map((item) {
              bool isActive = item.id == activeCategoryId;
              Color bgColor = isActive ? Colors.red[300]! : Colors.white;
              Color fontColor = isActive ? Colors.white : Colors.black;

              return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: bgColor),
                  width: 50,
                  height: 30,
                  child: GestureDetector(
                    child: Text(
                      item.title,
                      style: TextStyle(fontSize: 14, color: fontColor),
                    ),
                    onTap: () {
                      print(item.id);
                      context.read<CategoryProvider>().changeCategory(item.id);
                    },
                  ));
            }).toList(),
          ),
        ),
        Expanded(
          child: Container(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(5),
                  sliver: NewsListComponent(list: newsList),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
