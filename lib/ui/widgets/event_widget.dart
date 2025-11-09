import 'package:evently/model/catogry_dm.dart';
import 'package:evently/model/event_dm.dart';
import 'package:evently/ui/utills/appassets.dart';
import 'package:evently/ui/utills/appcolor.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final EventDm eventDm;
  const EventWidget({super.key, required this.eventDm});

  @override
  Widget build(BuildContext context) {
    CatogryDm catogryDm = CatogryDm.fromtitle(eventDm.catogryId);
    return Container(
      margin: EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * .25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(catogryDm.image)),
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
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            eventDm.date.day.toString(),
            style: TextStyle(
              color: Appcolor.blue,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            getMonth(eventDm.date.month),
            style: TextStyle(
              color: Appcolor.blue,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
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
            true ? Appassets.icfavoritActive : Appassets.icfavoritUnActive,
          ),
        ),
      ],
    ),
  );
  String getMonth(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    if (month < 1 || month > 12) {
      throw ArgumentError('Month must be between 1 and 12');
    }

    return months[month - 1];
  }
}
