import 'package:flutter/material.dart';

class FavouriteContacts extends StatelessWidget {
  final List<Widget> favouriteContacts;
  FavouriteContacts({Key key, @required this.favouriteContacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite contacts'),
      ),
      body: ListView(children: favouriteContacts),
    );
  }
}