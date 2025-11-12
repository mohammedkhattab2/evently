import 'package:evently/data/firestore_utilties.dart';
import 'package:evently/model/catogry_dm.dart';
import 'package:evently/model/event_dm.dart';
import 'package:evently/model/user_dm.dart';
import 'package:evently/ui/screens/event_details/event_daetails.dart';
import 'package:evently/ui/utills/appassets.dart';
import 'package:evently/ui/utills/appcolor.dart';
import 'package:evently/ui/widgets/catogry_tabs.dart';
import 'package:evently/ui/widgets/event_widget.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  CatogryDm selectedCatogry = CatogryDm.homeCatogries[0];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildHeader(),
        Expanded(child: buildEventsList()),
      ],
    );
  }

 Widget buildHeader() => Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Appcolor.blue,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    child: Column(
      children: [buildUserInfo(), SizedBox(height: 8), buildCatogryTabs()],
    ),
  );

 Widget buildUserInfo() => Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome Back ✨",
            style: TextStyle(color: Appcolor.white, fontSize: 14),
          ),
          Text(
            UserDm.currentUser!.name,
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

  Widget buildCatogryTabs() => CatogryTabs(
    onTabSelected: (catogry) {
      selectedCatogry = catogry;
      setState(() {});
    },
    catogries: CatogryDm.homeCatogries,
    selectedTabBg: Appcolor.white,
    unselectedTabBg: Appcolor.blue,
    selectedTabTextColor: Appcolor.blue,
    unselectedTabTexrColor: Appcolor.white,
  );

  Widget buildEventsList() => StreamBuilder(
    stream: getAllEventFromFirestore(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Center(child: Text(snapshot.error.toString()));
      } else if (snapshot.hasData) {
        var event = snapshot.data!;
       event = event.where((event) {
          if (selectedCatogry.title == "all") return true;
          return event.catogryId == selectedCatogry.title;
        }).toList();
        return ListView.builder(
          itemCount: event.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> EventDaetails(eventDm: event[index]) )),
              child: EventWidget(eventDm: event[index]));
          },
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  );
}
