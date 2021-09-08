import 'package:flutter/material.dart';

class Category {
  final String title;
  final String id;

  Category(this.title, this.id);
}

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [
    Category('推荐', 'top'),
    Category('国内', 'guonei'),
    Category('国际', 'guoji'),
    Category('娱乐', 'yule'),
    Category('体育', 'tiyu'),
    Category('军事', 'junshi'),
    Category('科技', 'keji'),
    Category('财经', 'caijing'),
    Category('时尚', 'shishang'),
    Category('游戏', 'youxi'),
    Category('汽车', 'qiche'),
    Category('健康', 'jiankang'),
  ];

  String _activeCategoryId = 'guoji';

  String get activeCategoryId => _activeCategoryId;
  List<Category> get categories => _categories;

  changeCategory(String id) {
    _activeCategoryId = id;
    notifyListeners();
  }
}
