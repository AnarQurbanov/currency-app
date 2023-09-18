import 'package:currency_app/models/from_to.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class FromToServices{
  Future<num> fetchResult(double amount,String from,String to) async{
    String url = "https://api.exchangerate.host/convert?amount=$amount&from=$from&to=$to";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200){
      final results = json.decode(response.body);
      FromTo fromTo = FromTo.fromJson(results);
      return fromTo.result ?? amount;
    }
    throw Exception("Bad Request");
  }
}