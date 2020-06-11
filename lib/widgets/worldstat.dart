import 'package:flutter/material.dart';

class WorldStat extends StatelessWidget {
  final Map worldData;

  const WorldStat({Key key, this.worldData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        'Worldwide Statistics',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 25,
          color: const Color(0xff567ccf),
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(height: 10),
      Wrap(
        children: [
          StatCard(
              "Confirmed", worldData["cases"], Colors.red[100], Colors.red),
          StatCard(
              "Active", worldData["active"], Colors.green[200], Colors.green),
          StatCard("Recovered", worldData["recovered"], Colors.blue[200],
              Colors.blue),
          StatCard("Death", worldData["deaths"], Colors.grey[200], Colors.grey),
        ],
      )
    ]);
  }
}

class StatCard extends StatelessWidget {
  final String heading;
  final int number;
  final Color color, bgcolor;

  const StatCard(this.heading, this.number, this.bgcolor, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: 150.0,
      height: 120.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: bgcolor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            heading,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 25,
              color: color,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            child: Text(
              number.toString(),
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                color: color,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
