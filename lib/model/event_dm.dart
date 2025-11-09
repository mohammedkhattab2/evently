import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventDm {
  static const String colictionName = "events";
  late String id;
  late String title;
  late String catogryId;
  late DateTime date;
  late String description;
  late int? lat;
  late int? lng;
  late String ownerId;

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
  Map<String, dynamic> toJson() {
    return {
      'ownerId': ownerId,
      'id': id,
      'title': title,
      'catogryId': catogryId,
      'date': date,
      'description': description,
      'lat': lat,
      'lng': lng,
    };
  }

  EventDm.fromJson(Map<String, dynamic> json) {
    ownerId = json['ownerId'];
    id = json['id'];
    title = json['title'];
    catogryId = json['catogryId'];
    var timeStamp = json['date'] as Timestamp;
    date = timeStamp.toDate();
    description = json['description'];
    lat = json['lat'];
    lng = json['lng'];
  }
}
