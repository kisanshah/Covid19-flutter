import 'dart:math';

import 'package:flutter/material.dart';

class StateStat extends StatelessWidget {
  final List stateData;

  const StateStat({Key key, this.stateData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: stateData.length,
          itemBuilder: (context, index) {
            return Container(
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
                    stateData[index]["state"],
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    stateData[index]["confirmed"].toString(),
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
