import 'package:flutter/material.dart';
import 'home/home.dart';
import 'news/list.dart';
import 'profile/profile.dart';
import 'rnstack/rnstack.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int currentIndex = 0;

  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '首页',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.menu_book),
      label: '新闻',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: 'RN',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: '我的',
    ),
  ];

  final List pages = [
    {
      'appBar': AppBar(
        title: Text('首页'),
        centerTitle: true,
      ),
      'page': Home(),
    },
    {
      'appBar': AppBar(
        title: Text('新闻列表'),
        centerTitle: true,
      ),
      'page': NewsList(),
    },
    {
      'appBar': AppBar(
        title: Text('Rnstack'),
        centerTitle: true,
      ),
      'page': Rnstack(),
    },
    {
      'appBar': AppBar(
        title: Text('个人中心'),
        centerTitle: true,
      ),
      'page': Profile(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pages[currentIndex]['appBar'],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue[400],
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: pages[currentIndex]['page'],
    );
  }
}
