import 'package:currency_app/models/data.dart';
import 'package:currency_app/services/country_currencies_services.dart';
import 'package:currency_app/services/from_to_services.dart';
import 'package:currency_app/widgets/drop_down.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CountryCurrenciesServices ccs = CountryCurrenciesServices();
  FromToServices fts = FromToServices();

  Future<List<Data>> getCurrencyList() async{
    return await ccs.fetchCurrencies();
  }
  List<String> currencies = [];
  @override
  void initState() {
    print("initstate");
    super.initState();
    () async{
      print("fonksiyon");
      List<Data> list = await getCurrencyList();
      setState(() {
        for (int i=0;i<=list.length-1;i++){
          currencies.add(list[i].id!);
        }
        currencies.sort();
      });
    }();
  }

  String from = "AZN";
  String to = "AZN";
  String result = "";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Column(
              children: [
                Container(
                  height: height / 6,
                  width: width / 2,
                  child: Center(
                      child: Text(
                    "Currency Converter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height / 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ],
            ),
          ),
          SizedBox(height: height/5,),
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      onSubmitted: (value) async{
                        num temp2 = await fts.fetchResult(double.parse(value), from, to);
                        result = temp2.toString();
                      },
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        labelText: "Input value to convert",
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customDropDown(currencies, from, (from) {
                          setState(() {
                            this.from = from;
                          });
                        }),
                        FloatingActionButton(
                            backgroundColor: Colors.blue,
                            onPressed: () {
                              String temp = "";
                              setState(() {
                                temp = from;
                                from = to;
                                to = temp;
                              });
                              print(from + " " + to);
                            },
                            child: Icon(
                              Icons.swap_horiz,
                              color: Colors.white,
                            )),
                        customDropDown(currencies, to, (to) {
                          setState(() {
                            this.to = to;
                          });
                        }),
                      ],
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: width-40,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Result",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            result,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
