import 'package:evently/model/event_dm.dart';
import 'package:evently/ui/utills/appassets.dart';
import 'package:evently/ui/utills/appcolor.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final EventDm eventDm;
  const EventWidget({super.key, required this.eventDm});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(eventDm.image)),
      ),
      child: Column(children: [builddate(), buildTitle()]),
    );
  }

  builddate() {
    return Container(
      decoration: BoxDecoration(
        color: Appcolor.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        eventDm.date,
        style: TextStyle(
          color: Appcolor.blue,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  buildTitle() => Container(
    decoration: BoxDecoration(
      color: Appcolor.white,
        borderRadius: BorderRadius.circular(8),
    ),
    child: Row(children: [
      Text(eventDm.title, style: TextStyle(
        color: Colors.black ,
        fontSize: 14,
        fontWeight: FontWeight.w700

      ),),
      Spacer(),
      ImageIcon(AssetImage(eventDm.isFavorite? Appassets.icfavoritActive: Appassets.icfavoritUnActive))
    ]));
}
