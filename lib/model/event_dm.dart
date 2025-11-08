import 'package:flutter/material.dart';

class EventDm {
  static const String colictionName = "events";
  String id;
  String title;
  String catogryId;
  DateTime date;
  String description;
  int? lat;
  int? lng;
  String ownerId;

  EventDm({
    required this.ownerId,
    required this.id,
    required this.title,
    required this.catogryId,
    required this.date,
    required this.description,
  
    this.lat,
    this.lng,
  });
}
