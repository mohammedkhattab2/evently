import 'package:evently/ui/utills/appassets.dart';
import 'package:flutter/material.dart';

class CatogryDm {
  IconData icon;
  String title;
  CatogryDm({required this.icon, required this.title});

  static List<CatogryDm> homeCatogries = [
    CatogryDm(icon: Icons.all_inbox, title: "all"),
    CatogryDm(icon: Icons.sports_handball, title: "sports"),
    CatogryDm(icon: Icons.holiday_village, title: "Holiday"),
    CatogryDm(icon: Icons.meeting_room, title: "Meeting"),
    CatogryDm(icon: Icons.cake, title: "Birthday"),
    CatogryDm(icon: Icons.book_online, title: "booking Club"),
  ];
  static List<CatogryDm> creatEventCatogries = [
    CatogryDm(icon: Icons.all_inbox, title: "all"),
    CatogryDm(icon: Icons.sports_handball, title: "sports"),
    CatogryDm(icon: Icons.holiday_village, title: "Holiday"),
    CatogryDm(icon: Icons.meeting_room, title: "Meeting"),
    CatogryDm(icon: Icons.cake,  title: "Birthday"),
    CatogryDm(icon: Icons.book_online, title: "bocking Club"),
  ];
}
