import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myflutter/providers/NewsProvider.dart';
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
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);

    G.api.news.newsList(type: 'top').then((newsListResp) {
      List newNews = newsListResp['result']['data'];
      context.read<NewsProvider>().addNews('top', newNews);
    });
    super.initState();
  }

  /// 到达顶部, 刷新
  Future _handleReachTop() async {
    print('下拉刷新');
    String categoryId =
        Provider.of<CategoryProvider>(context, listen: false).activeCategoryId;
    context.read<NewsProvider>().clearNews(categoryId);
    G.api.news.newsList(type: categoryId).then((newsListResp) {
      List newNews = newsListResp['result']['data'];
      context.read<NewsProvider>().addNews(categoryId, newNews);
    });
  }

  /// 触底加载更多新闻
  _handleReachBottom() {
    print('加载更多新闻');
    String categoryId =
        Provider.of<CategoryProvider>(context, listen: false).activeCategoryId;
    NewsOfCategory noc =
        Provider.of<NewsProvider>(context, listen: false).getNews(categoryId);
    int page = noc.page;
    G.api.news.newsList(type: categoryId, page: page + 1).then((newsListResp) {
      List newNews = newsListResp['result']['data'];
      context.read<NewsProvider>().addNews(categoryId, newNews);
    });
  }

  _scrollListener() {
    double offset = _controller.offset;
    double maxScrollExtent = _controller.position.maxScrollExtent;
    bool outOfRange = _controller.position.outOfRange;

    if (offset >= maxScrollExtent && !outOfRange) {
      _handleReachBottom();
    }
  }

  _handleCategorySelect(String categoryId) {
    context.read<CategoryProvider>().changeCategory(categoryId);
    NewsOfCategory noc =
        Provider.of<NewsProvider>(context, listen: false).getNews(categoryId);
    List newsList = noc.news;
    int page = noc.page;

    if (newsList.isEmpty) {
      G.api.news
          .newsList(type: categoryId, page: page + 1)
          .then((newsListResp) {
        List newNews = newsListResp['result']['data'];
        print('add news to ' + categoryId);
        print(newNews[0]);
        context.read<NewsProvider>().addNews(categoryId, newNews);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Category> categories = context.watch<CategoryProvider>().categories;
    String activeCategoryId =
        context.watch<CategoryProvider>().activeCategoryId;
    List newsList =
        context.watch<NewsProvider>().getNews(activeCategoryId).news;

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
                      _handleCategorySelect(item.id);
                    },
                  ));
            }).toList(),
          ),
        ),
        Expanded(
          child: Container(
            child: RefreshIndicator(
              onRefresh: _handleReachTop,
              child: CustomScrollView(
                controller: _controller,
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.all(5),
                    sliver: NewsListComponent(list: newsList),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
