import 'package:flutter/material.dart';

import 'package:nowaste/map/map.dart';
import 'package:nowaste/map/marker_anchor.dart';

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
          selected: currentRoute == Map.route,
          onTap: () {
            Navigator.pushReplacementNamed(context, Map.route);
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
