import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NoWaste - Downloads APK for android')),
      //BlocBuilder<MapBloc, MapState>(
      body: Padding(
        padding: EdgeInsets.all(100),
        child: Center(
          child: OutlineButton(
            onPressed: () => {},
            borderSide: BorderSide(
              color: Colors.blueAccent,
              style: BorderStyle.solid,
              width: 2
            ),
            hoverColor: Colors.green,
            textColor: Colors.green,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.android),
                SizedBox(width: 10),
                Text("Click here to download Nowaste Android app ! "),
              ],
            )
          ),
        )
      )
    );
  }
}