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
      margin: EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * .25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(eventDm.image)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [builddate(), Spacer(), buildTitle()],
      ),
    );
  }

  builddate() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(left: 8, top: 8),
      decoration: BoxDecoration(
        color: Appcolor.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        textAlign: TextAlign.center,
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
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(10),

    decoration: BoxDecoration(
      color: Appcolor.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Text(
          eventDm.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        ImageIcon(
          AssetImage(
            eventDm.isFavorite
                ? Appassets.icfavoritActive
                : Appassets.icfavoritUnActive,
          ),
        ),
      ],
    ),
  );
}
