import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiSports {
  static Future<List<dynamic>> getSports() async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=767211af63d940feb487a02285d8a24b');
      var response = await http.get(url);
      var decoded = jsonDecode(response.body);
      //print(decoded['articles']);
      return decoded['articles'] as List<dynamic>;
    } catch (ex) {
      return [];
    }
  }
}
