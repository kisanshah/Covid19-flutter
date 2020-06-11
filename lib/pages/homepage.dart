import 'dart:convert';
import 'package:covid_updates/data.dart';
import 'package:covid_updates/pages/CountryList.dart';
import 'package:covid_updates/pages/SyntomPage.dart';
import 'package:covid_updates/pages/PreventionPage.dart';
import 'package:covid_updates/widgets/countrystat.dart';
import 'package:covid_updates/widgets/heading.dart';
import 'package:covid_updates/widgets/itemcard.dart';
import 'package:covid_updates/widgets/statestat.dart';
import 'package:covid_updates/widgets/worldstat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List countryData, states;
  Map worldData, stateData;
  fetchStateData() async {
    http.Response response = await http.get(
        "https://api.rootnet.in/covid19-in/unofficial/covid19india.org/statewise");
    setState(() {
      stateData = json.decode(response.body);
      states = stateData["data"]["statewise"];
    });
  }

  fetchWorlWideData() async {
    http.Response response = await http.get("https://corona.lmao.ninja/v2/all");
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  fetchCountryData() async {
    http.Response response = await http
        .get("https://corona.lmao.ninja/v2/countries?yesterday&sort=cases");
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchStateData();
    fetchWorlWideData();
    fetchCountryData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: accent,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heading(),
            SizedBox(height: 15),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(46.0),
                    topRight: Radius.circular(46.0),
                  ),
                  color: const Color(0xffffffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    ItemCard("assets/img1.png", "Syntomns", red,SyntomnPage()),
                    ItemCard("assets/img2.png", "Prevention", green,PreventionPage()),
                    SizedBox(height: 20),
                    Center(
                      child: worldData == null
                          ? CircularProgressIndicator()
                          : WorldStat(worldData: worldData),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Top Country',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              color: const Color(0xff567ccf),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CountryList(country: countryData)));
                            },
                            child: Text(
                              'View all',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                color: const Color(0xff567ccf),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    countryData == null
                        ? CircularProgressIndicator()
                        : CountryStat(country: countryData),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Top States(India)',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              color: const Color(0xff567ccf),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'View all',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: const Color(0xff567ccf),
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),

                    stateData == null
                        ? CircularProgressIndicator()
                        : StateStat(
                            stateData: states,
                          ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
