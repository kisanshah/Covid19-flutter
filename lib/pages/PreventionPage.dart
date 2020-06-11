import 'package:flutter/material.dart';

import 'SyntomPage.dart';

class PreventionPage extends StatefulWidget {
  @override
  _PreventionPageState createState() => _PreventionPageState();
}

class _PreventionPageState extends State<PreventionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff567ccf).withOpacity(0.9),
      appBar: AppBar(
        title: Text("Prevention"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ItemBuild(imgPath: "assets/prevention1.png", heading: "DO NOT SNEEZE IN THE PALM OF YOUR HAND"),
            ItemBuild(imgPath: "assets/prevention2.png", heading: "WEARING MASK AND GLOVES"),
            ItemBuild(imgPath: "assets/prevention3.png", heading: "WASH YOUR HANDS FREQUENTLY"),
            ItemBuild(imgPath: "assets/prevention4.png", heading: "STAY AT HOME"),
          ],
        ),
      ),
    );
  }
}