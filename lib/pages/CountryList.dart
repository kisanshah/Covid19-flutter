import 'package:flutter/material.dart';
import 'dart:math' as math;

class CountryList extends StatefulWidget {
  final List country;

  const CountryList({Key key, this.country}) : super(key: key);

  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Country List")),
      body: SafeArea(
        child: ListView.builder(itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Color(0xff567ccf).withOpacity(0.8),
              child: Row(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          widget.country[index]["country"],
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Image.network(
                            widget.country[index]["countryInfo"]["flag"],
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildText("Total Cases"),
                        buildText("Total Active"),
                        buildText("Total Recovered"),
                        buildText("Total Deaths"),
                        buildText("Cases Today"),
                      ]),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildText(widget.country[index]["cases"].toString()),
                        buildText(widget.country[index]["active"].toString()),
                        buildText(
                            widget.country[index]["recovered"].toString()),
                        buildText(widget.country[index]["deaths"].toString()),
                        buildText(
                            widget.country[index]["todayCases"].toString()),
                      ]),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Text buildText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 18,
        color: const Color(0xffffffff),
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.start,
    );
  }
}
