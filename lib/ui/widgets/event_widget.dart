import 'package:evently/data/firestore_utilties.dart';
import 'package:evently/model/catogry_dm.dart';
import 'package:evently/model/event_dm.dart';
import 'package:evently/model/user_dm.dart';
import 'package:evently/ui/utills/appassets.dart';
import 'package:evently/ui/utills/appcolor.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatefulWidget {
  final EventDm eventDm;
  final Function? onfavClick;
  const EventWidget({super.key, required this.eventDm, this.onfavClick});

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    CatogryDm catogryDm = CatogryDm.fromtitle(widget.eventDm.catogryId);
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
            widget.eventDm.date.day.toString(),
            style: TextStyle(
              color: Appcolor.blue,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            getMonth(widget.eventDm.date.month),
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
          widget.eventDm.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        buildFavoriteIcon(),
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

  Widget buildFavoriteIcon() {
    var isFavorit = UserDm.currentUser!.favoritEvents.contains(
      widget.eventDm.id,
    );
    return InkWell(
      onTap: () async {
        widget.onfavClick?.call();
        isFavorit
            ? await removeEventFromFavorite(widget.eventDm.id)
            : await addEventToFavorite(widget.eventDm.id);
        setState(() {});
      },

      child: ImageIcon(
        AssetImage(
          isFavorit ? Appassets.icfavoritActive : Appassets.icfavoritUnActive,
        ),
      ),
    );
  }
}
