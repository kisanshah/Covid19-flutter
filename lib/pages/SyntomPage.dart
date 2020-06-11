import 'package:flutter/material.dart';

class SyntomnPage extends StatefulWidget {
  SyntomnPage({Key key}) : super(key: key);

  @override
  _SyntomnPageState createState() => _SyntomnPageState();
}

class _SyntomnPageState extends State<SyntomnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff567ccf).withOpacity(0.9),
      appBar: AppBar(
        title: Text("Syntomns"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ItemBuild(imgPath: "assets/cough.png", heading: "Cough"),
            ItemBuild(imgPath: "assets/fever.png", heading: "High Fever"),
            ItemBuild(imgPath: "assets/cough.png", heading: "Sore Troath"),
            ItemBuild(imgPath: "assets/headache.png", heading: "Headache"),
          ],
        ),
      ),
    );
  }
}

class ItemBuild extends StatelessWidget {
  final String imgPath, heading;

  const ItemBuild({Key key, this.imgPath, this.heading}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff567ccf), borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imgPath,
                height: 150,
                width: 150,
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                     heading,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
