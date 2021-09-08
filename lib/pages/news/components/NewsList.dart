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
          List<Widget> children = [];
          List<String> imgs = [];

          [
            'thumbnail_pic_s',
            'thumbnail_pic_s02',
            'thumbnail_pic_s03',
          ].forEach((element) {
            if (news[element] != null) imgs.add(news[element]);
          });

          Widget thirdLine = Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 130,
                child: Text(
                  news['date'],
                  style: const TextStyle(fontSize: 12, height: 1.5),
                ),
              ),
              Expanded(
                child: Container(
                  height: 20,
                  child: Text(
                    news['author_name'],
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
              Container(
                height: 20,
                width: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
            ],
          );

          List<Widget> imgComponents = imgs
              .map((url) => Expanded(
                    flex: 1,
                    child: Image(
                      image: NetworkImage(url),
                      height: imgs.length == 3 ? 60 : 100,
                    ),
                  ))
              .toList();

          Widget titleComponent = Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
              news['title'],
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          );

          if (imgs.length == 3) {
            children
              ..add(titleComponent)
              ..add(Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: imgComponents,
                ),
              ))
              ..add(thirdLine);
          } else {
            children.add(
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [titleComponent, thirdLine],
                    ),
                  ),
                  ...imgComponents,
                ],
              ),
            );
          }

          return GestureDetector(
            onTap: () {
              print(index);
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.black54),
                ),
              ),
              child: Flex(
                direction: Axis.vertical,
                children: children,
              ),
            ),
          );
        },
        childCount: widget.list.length,
      ),
    );
  }
}
