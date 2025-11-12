import 'package:evently/model/catogry_dm.dart';
import 'package:evently/model/event_dm.dart';
import 'package:evently/ui/utills/appcolor.dart';
import 'package:flutter/material.dart';

class EventDaetails extends StatelessWidget {
  final EventDm eventDm;
  const EventDaetails({super.key, required this.eventDm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(children: [buildCatogryImage()]),
    );
  }

  PreferredSizeWidget? buildAppBar() {
    return AppBar(
      title: Text("Event Details"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.edit),
          color: Appcolor.blue,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete),
          color: Appcolor.red,
        ),
      ],
    );
  }

  buildCatogryImage() {
    CatogryDm catogryDm = CatogryDm.fromtitle(eventDm.catogryId);
    return Image.asset(catogryDm.image);
  }
}
