import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import './pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowaste/navigation/bloc/navigation.dart';
import 'package:nowaste/splash/splash_page.dart';
import 'package:nowaste/utils/delegates.dart';


void main() async {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc()..add(AppStarted()),
      child: MaterialApp(
        title: 'Welcome to Flutter',
        home: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (BuildContext context, NavigationState state) {
            if (state is AppInitialized) {
              return HomePage();
              //return Contacts();
            }
            return SplashPage();
          }
        )
      )
    );
  }
}

// class MyApp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'NoWaste Map',
//       theme: ThemeData(
//         primarySwatch: mapBoxBlue,
//       ),
//       home: HomePage(),
//       routes: <String, WidgetBuilder>{
//         MarkerAnchorPage.route: (context) => MarkerAnchorPage(),
//         //PluginPage.route: (context) => PluginPage(),
//         //OfflineMapPage.route: (context) => OfflineMapPage(),
//         //MovingMarkersPage.route: (context) => MovingMarkersPage(),

//       },
//     );
//   }
// }


// const int _bluePrimary = 0xFF395afa;
// const MaterialColor mapBoxBlue = MaterialColor(
//   _bluePrimary,
//   <int, Color>{
//     50: Color(0xFFE7EBFE),
//     100: Color(0xFFC4CEFE),
//     200: Color(0xFF9CADFD),
//     300: Color(0xFF748CFC),
//     400: Color(0xFF5773FB),
//     500: Color(_bluePrimary),
//     600: Color(0xFF3352F9),
//     700: Color(0xFF2C48F9),
//     800: Color(0xFF243FF8),
//     900: Color(0xFF172EF6),
//   },
// );

// Widget build(BuildContext context) {
//   return new FlutterMap(
//     options: new MapOptions(
//       center: new LatLng(51.5, -0.09),
//       zoom: 13.0,
//     ),
//     layers: [
//       new TileLayerOptions(
//         urlTemplate: "https://api.tiles.mapbox.com/v4/"
//             "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
//         additionalOptions: {
//           'accessToken': '<PUT_ACCESS_TOKEN_HERE>',
//           'id': 'mapbox.streets',
//         },
//       ),
//     ],
//   );