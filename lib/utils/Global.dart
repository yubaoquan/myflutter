import 'package:fluro/fluro.dart';
import '../api/API.dart';

class G {
  static late FluroRouter router;

  static final API api = API();

  static String parseQuery(Map<String, dynamic> p) {
    String query = '?';
    int index = 0;
    for (String key in p.keys) {
      final String value = Uri.encodeComponent(p[key].toString());
      if (index != 0) query += '&';

      query += '$key=$value';
      index++;
    }
    return query;
  }
}
