import 'package:flutter/material.dart';

import '../pages/home.dart';
import '../pages/marker_anchor.dart';

Drawer buildDrawer(BuildContext context, String currentRoute) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        const DrawerHeader(
          child: Center(
            child: Text('NoWaste Map'),
          ),
        ),
        ListTile(
          title: const Text('Carte'),
          selected: currentRoute == HomePage.route,
          onTap: () {
            Navigator.pushReplacementNamed(context, HomePage.route);
          },
        ),
        ListTile(
          title: const Text("Points d'intérêt "),
          selected: currentRoute == MarkerAnchorPage.route,
          onTap: () {
            Navigator.pushReplacementNamed(context, MarkerAnchorPage.route);
          },
        ),
      ],
    ),
  );
}
