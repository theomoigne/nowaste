import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final String name;
  final bool isFavourite;
  Contact(this.name, this.isFavourite);

  @override
  List<Object> get props => [name];
}