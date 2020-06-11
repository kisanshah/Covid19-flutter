import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String imgPath, heading;
  final Color color;
  final Widget page;
  const ItemCard(this.imgPath, this.heading, this.color, this.page);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.only(right: 30),
          margin: const EdgeInsets.only(top: 55),
          width: MediaQuery.of(context).size.width,
          height: 110.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: color,
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  heading,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5),
                Container(
                  width: 100.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    border: Border.all(width: 1.2, color: Colors.white),
                  ),
                  child: Center(
                    child: Text(
                      'know more',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 30),
          child: Image.asset(
            imgPath,
            height: 150,
          ),
        ),
      ]),
    );
  }
}
