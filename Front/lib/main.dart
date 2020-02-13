import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowaste/navigation/bloc/navigation.dart';
import 'package:nowaste/src/models/contact.dart';
import 'package:nowaste/src/screens/favouritesContacts.dart';
import 'package:nowaste/splash/splash_page.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    BlocProvider<NavigationBloc>(
      create: (context) {
        return NavigationBloc()..add(AppStarted());
      },
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        // Contacts()
        home: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            if (state is AppNotInitialized) {
              return SplashPage();
            }
            if (state is AppInitialized) {
              return Contacts(state.contacts);
            }
          },
        ));
  }
}

class Contacts extends StatelessWidget {
  final contacts;
  final _favouriteContacts = Set<Contact>();
  final _fontSize = const TextStyle(fontSize: 18);

  Contacts({@required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My contact App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _showFavouriteContact,
          )
        ],
      ),
      body: Center(
        child: _buildContactList(),
      ),
    );
  }

  Widget _buildContactList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _contacts.length,
        itemBuilder: (context, i) {
          return _buildContactLine(_contacts[i]);
        });
  }

  Widget _buildContactLine(Contact contact) {
    final bool isFavourite = _favouriteContacts.contains(contact);
    return ListTile(
      title: Text(contact.name, style: _fontSize),
      trailing: Icon(
        isFavourite ? Icons.favorite : Icons.favorite_border,
        color: isFavourite ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (isFavourite) {
            _favouriteContacts.remove(contact);
          } else {
            _favouriteContacts.add(contact);
          }
        });
      },
    );
  }

  void addContat(var name) {
    _contacts.add(new Contact(name));
  }

  void _showFavouriteContact() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _favouriteContacts.map(
            (Contact contact) {
              return ListTile(
                title: Text(
                  contact.name,
                  style: _fontSize,
                ),
              );
            },
          );

          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return FavouriteContacts(
            favouriteContacts: divided,
          );
        },
      ),
    );
  }
}
