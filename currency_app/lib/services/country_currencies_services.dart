import 'package:currency_app/models/country_currencies.dart';
import 'package:currency_app/models/data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CountryCurrenciesServices{
  Future<List<Data>> fetchCurrencies() async{
    String url = "https://api.coinbase.com/v2/currencies";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200){
      final results = json.decode(response.body);
      CountryCurrencies cc = CountryCurrencies.fromJson(results);
      return cc.data ?? []; 
    }
    throw Exception("Bad Request");
  }
}