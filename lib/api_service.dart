import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {

  ApiService._();

  static ApiService instance =ApiService._();


  Future<Response> fetchDataFromApi() async {
    final url = Uri.parse("https://66fbb69f8583ac93b40cdf37.mockapi.io/sample");
    var response = await http.get(url);
    print("the respone is:${response.body}");
    return response;

  }
}