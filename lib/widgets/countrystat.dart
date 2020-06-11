import 'package:covid_updates/pages/CountryPage.dart';
import 'package:flutter/material.dart';
import "dart:math" as math;

class CountryStat extends StatelessWidget {
  final List country;
  const CountryStat({Key key, this.country}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: country.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CountryPage(
                            countryName: country[index]["country"])));
              },
              child: Container(
                margin: EdgeInsets.all(5),
                width: 120.0,
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: const Color(0xff567ccf).withOpacity(0.9),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      country[index]["country"],
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      country[index]["cases"].toString(),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Image.network(
                        country[index]["countryInfo"]["flag"],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
