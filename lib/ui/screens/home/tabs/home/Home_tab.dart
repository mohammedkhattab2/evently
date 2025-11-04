import 'package:evently/model/catogry_dm.dart';
import 'package:evently/model/event_dm.dart';
import 'package:evently/ui/utills/appassets.dart';
import 'package:evently/ui/utills/appcolor.dart';
import 'package:evently/ui/widgets/catogry_tabs.dart';
import 'package:evently/ui/widgets/event_widget.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildHeader(),
        Expanded(child: buildEventsList()),
      ],
    );
  }

  buildHeader() => Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Appcolor.blue,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    child: Column(children: [buildUserInfo(), buildCatogryTabs()]),
  );

  buildUserInfo() => Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome Back ✨",
            style: TextStyle(color: Appcolor.white, fontSize: 14),
          ),
          Text(
            "Jon Safwat",
            style: TextStyle(
              color: Appcolor.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 11.5),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.white),
              Text(
                "Cairo, Egypt",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
      Spacer(),
      Icon(Icons.language, color: Colors.white),
      Icon(Icons.light_mode, color: Colors.white),
    ],
  );

  buildCatogryTabs() => Container(
    child: CatogryTabs(
      onTabSelected: (catogry){

      },
      catogries: CatogryDm.homeCatogries,
      selectedTabBg: Appcolor.white,
      unselectedTabBg: Appcolor.blue,
      selectedTabTextColor: Appcolor.blue,
      unselectedTabTexrColor: Appcolor.white),
  );

  Widget buildEventsList() => ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) => EventWidget(
      eventDm: EventDm(
        title: "This is a Birthday Party ",
        image: Appassets.birthday,
        date: "21 \n nov",
        isFavorite: true,
        description: "description",
        time: "time",
        lat: 0,
        lng: 0,
      ),
    ),
  );
}
