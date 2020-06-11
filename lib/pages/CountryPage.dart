import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  final Widget child;
  final String countryName;
  CountryPage({Key key, this.child, this.countryName}) : super(key: key);

  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List<charts.Series<Data, int>> _seriesLineData;
  List country;
  List<Data> lineDatadata = [],
      lineDatadata0 = [],
      lineDatadata1 = [],
      lineDatadata2 = [];
  fetchCountryData() async {
    http.Response response = await http
        .get("https://api.covid19api.com/dayone/country/" + widget.countryName);
    setState(() {
      country = json.decode(response.body);
      int count = 1;
      for (int i = 0; i < country.length; i++) {
        lineDatadata.add(Data(count, country[i]["Confirmed"]));
        lineDatadata0.add(Data(count, country[i]["Active"]));
        lineDatadata1.add(Data(count, country[i]["Recovered"]));
        lineDatadata2.add(Data(count, country[i]["Deaths"]));
        count = count + 1;
      }
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
    _seriesLineData = List<charts.Series<Data, int>>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff567ccf),
      appBar: AppBar(
        title: Text("Country Statistics"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10,),
              Text(
                'Covid-19',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                'Virus Tracking',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Container(
              
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(46.0),
                      topRight: Radius.circular(46.0),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      child: lineDatadata == null
                          ? Text("Unavailable")
                          : graph(
                              color: Colors.red,
                              list: lineDatadata,
                              seriesLineData: _seriesLineData,
                            ),
                    ),
                    Text("Confirmed Cases Stats"),
                    Container(
                      height: 200,
                      child: lineDatadata == null
                          ? Text("Unavailable")
                          : graph(
                              color: Colors.blue,
                              list: lineDatadata0,
                              seriesLineData: _seriesLineData,
                            ),
                    ),
                    Text("Active Cases Stats"),
                    Container(
                      height: 200,
                      child: lineDatadata == null
                          ? Text("Unavailable")
                          : graph(
                              color: Colors.green,
                              list: lineDatadata,
                              seriesLineData: _seriesLineData,
                            ),
                    ),
                    Text("Recovered Cases Stats"),
                    Container(
                      height: 200,
                      child: lineDatadata == null
                          ? Text("Unavailable")
                          : graph(
                              color: Colors.grey,
                              list: lineDatadata2,
                              seriesLineData: _seriesLineData,
                            ),
                    ),
                    Text("Death Cases Stats"),
                   
                    
                   
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Data {
  int yearval;
  int number;

  Data(this.yearval, this.number);
}

class graph extends StatelessWidget {
  final List<charts.Series<Data, int>> seriesLineData;
  final List<Data> list;
  final Color color;

  const graph({Key key, this.seriesLineData, this.list, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    seriesLineData.clear();
    seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(color),
        id: 'Death',
        data: list,
        domainFn: (Data data, _) => data.yearval,
        measureFn: (Data data, _) => data.number,
      ),
    );
    return charts.LineChart(
      seriesLineData,
      defaultRenderer:
          new charts.LineRendererConfig(includeArea: true, stacked: true),
      animate: true,
      animationDuration: Duration(seconds: 2),
    );
  }
}
