import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowaste/landingPage/bloc/landingPage_bloc.dart';

class LandingPage extends StatelessWidget {
  final _landingPageBloc = LandingPageBloc()..add(LoadingPageInitializationEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NoWaste - Downloads APK for android')),
      body: BlocBuilder<LandingPageBloc, LandingPageState>(
        bloc: _landingPageBloc,
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(100),
            child: Center(
              child: OutlineButton(
                onPressed: () => 
                  _landingPageBloc.add(DownloadAPKEvent()),
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
          );
        }
      )
    );
  }
}