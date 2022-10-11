import 'package:flutter/material.dart';


class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[

          Container(
            color: Colors.amber,
          ),

          Container(
            color: Colors.blue,
          ),
        ],

      )
   );
  }
}