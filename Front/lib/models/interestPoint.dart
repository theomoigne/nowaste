import 'package:latlong/latlong.dart';

class InterestPoint {
  final String id;
  final LatLng location;
  final String name;
  final DateTime creationDate;
  final DateTime dueDate;
  final String type;

  InterestPoint(
    this.id, 
    this.location, 
    this.name, 
    this.creationDate, 
    this.dueDate, 
    this.type
  );
  
  static InterestPoint fromJson(Map<String, dynamic> json) {
    final dueDate = json['due_date'] != null
      ? DateTime.parse(json['due_date']) 
      : DateTime.now();
    dynamic co = json['location']['coordinates'];

    return InterestPoint(
      json['id'].toString(),
      LatLng(co[0], co[1]),
      json['name'],
      DateTime.parse(json['creation_date']),
      dueDate,
      json['type']
    );
  }
}
