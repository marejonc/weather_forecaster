import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkingService {
  NetworkingService(this.url);

  final String url;

  Future getData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
