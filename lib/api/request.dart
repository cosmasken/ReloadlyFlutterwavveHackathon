
import 'package:http/http.dart' as http;

class Request {
  final String url;
  final dynamic body;

  Request({required this.url, this.body});

  Future<http.Response> post() {
    return http.post(Uri.parse('https://harambeeapps.co.ke/fashiola' + url), body: body).timeout(Duration(minutes: 5));
  }
  Future<http.Response> get() {
    return http.get(Uri.parse('https://harambeeapps.co.ke/fashiola' + url)).timeout(Duration(minutes: 5));
  }
}