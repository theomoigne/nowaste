import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowaste/navigation/bloc/navigation.dart';
import 'package:nowaste/src/models/contact.dart';

class Contacts extends StatelessWidget {
  final List<Contact> contacts;
  final _fontSize = const TextStyle(fontSize: 18);

  Contacts({this.contacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My contact App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              BlocProvider.of<NavigationBloc>(context).add(ShowFavourites());
            },
          )
        ],
      ),
      body: Center(
        child: _buildContactList(context),
      ),
    );
  }

  Widget _buildContactList(context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: contacts.length,
      itemBuilder: (context, i) {
        return _buildContactLine(contacts[i], context);
      }
    );
  }

  Widget _buildContactLine(Contact contact, context) {
    print(contact.isFavourite);
    return ListTile(
      title: Text(contact.name, style: _fontSize),
      trailing: Icon(
        contact.isFavourite ? Icons.favorite : Icons.favorite_border,
        color: contact.isFavourite ? Colors.red : null,
      ),
      onTap: () {
        BlocProvider.of<NavigationBloc>(context).add(SwitchFaourite(contact));
      },
    );
  }

  void addContat(var name) {
    contacts.add(new Contact(name, false));
  }

}
