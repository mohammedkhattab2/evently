import 'package:evently/ui/utills/appassets.dart';
import 'package:flutter/material.dart';

class CatogryDm {
  IconData icon;
  String title;
  String image;
  CatogryDm({required this.icon, required this.title, required this.image});

  static List<CatogryDm> homeCatogries = [
    CatogryDm(
      icon: Icons.all_inbox,
      title: "all",
      image: Appassets.appVerticalLogo,
    ),
    CatogryDm(
      icon: Icons.sports_handball,
      title: "sports",
      image: Appassets.sportsImage,
    ),
    CatogryDm(
      icon: Icons.holiday_village,
      title: "Holiday",
      image: Appassets.holidayImage,
    ),
    CatogryDm(
      icon: Icons.meeting_room,
      title: "Meeting",
      image: Appassets.mettingImage,
    ),
    CatogryDm(
      icon: Icons.cake,
      title: "Birthday",
      image: Appassets.birthdayImage,
    ),
    CatogryDm(
      icon: Icons.book_online,
      title: "booking Club",
      image: Appassets.bookImage,
    ),
  ];
  static List<CatogryDm> creatEventCatogries = [
    CatogryDm(
      icon: Icons.sports_handball,
      title: "sports",
      image: Appassets.sportsImage,
    ),
    CatogryDm(
      icon: Icons.holiday_village,
      title: "Holiday",
      image: Appassets.holidayImage,
    ),
    CatogryDm(
      icon: Icons.meeting_room,
      title: "Meeting",
      image: Appassets.mettingImage,
    ),
    CatogryDm(
      icon: Icons.cake,
      title: "Birthday",
      image: Appassets.birthdayImage,
    ),
    CatogryDm(
      icon: Icons.book_online,
      title: "bocking Club",
      image: Appassets.bookImage,
    ),
  ];
  static CatogryDm fromtitle(String title) {
    return homeCatogries.firstWhere((catogry) {
      return title == catogry.title;
    });
  }
}
