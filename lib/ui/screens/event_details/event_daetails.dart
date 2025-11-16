import 'package:evently/model/catogry_dm.dart';
import 'package:evently/model/event_dm.dart';
import 'package:evently/ui/utills/appcolor.dart';
import 'package:evently/ui/utills/approuts.dart';
import 'package:flutter/material.dart';

class EventDaetails extends StatefulWidget {
  final EventDm eventDm;
  const EventDaetails({super.key, required this.eventDm});

  @override
  State<EventDaetails> createState() => _EventDaetailsState();
}

class _EventDaetailsState extends State<EventDaetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildCatogryImage(),
          SizedBox(height: 16),
          buildingEventtitle(),
          SizedBox(height: 16),
          buildingEventDate(),
          SizedBox(height: 16),
          buildingEventLocation(),
          SizedBox(height: 16),
          buildingEventDescription(),
        ],
      ),
    );
  }

  PreferredSizeWidget? buildAppBar() {
    return AppBar(
      title: Text("Event Details"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context, Approuts.updateEvent(widget.eventDm));
          },
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

  Widget buildCatogryImage() {
    CatogryDm catogryDm = CatogryDm.fromtitle(widget.eventDm.catogryId);
    return Image.asset(catogryDm.image);
  }

  buildingEventtitle() => Text(
    "We Are Going To Play Football",
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Appcolor.blue,
    ),
  );

  buildingEventDate() => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Appcolor.blue),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Appcolor.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.calendar_month, color: Appcolor.white),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.eventDm.date.day} - ${widget.eventDm.date.month} - ${widget.eventDm.date.year}",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              "${widget.eventDm.date.hour} : ${widget.eventDm.date.minute}",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ],
    ),
  );

  buildingEventLocation() => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Appcolor.blue),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Appcolor.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.location_searching_rounded, color: Appcolor.white),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Location", style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ],
    ),
  );
  buildingEventDescription() => Column(
    children: [
      Row(
        children: [
          Text("decription", style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
      Row(
        children: [
          Text(
            widget.eventDm.description,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    ],
  );
}
