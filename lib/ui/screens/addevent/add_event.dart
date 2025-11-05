import 'package:evently/model/catogry_dm.dart';
import 'package:evently/ui/utills/appassets.dart';
import 'package:evently/ui/utills/appcolor.dart';
import 'package:evently/ui/widgets/catogry_tabs.dart';
import 'package:evently/ui/widgets/custom_botton.dart';
import 'package:evently/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddEvent extends StatelessWidget {
  const AddEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            buildCatogryImage(),
            buildCatogryTab(),
            buildTitleTextField(),
            buildDescriptionTextField(),
            buildEventDate(),
            buildEventTime(),
            buildEventLocation(),
            Spacer(),
            buildAddEventButton(),
          ],
        ),
      ),
    );
  }

  buildAppBar() => AppBar(title: Text("Creat event"));

  buildCatogryImage() => ClipRRect(
    borderRadius: BorderRadiusGeometry.circular(16),
    child: Image.asset(Appassets.sportsImage),
  );

  buildCatogryTab() => CatogryTabs(
    onTabSelected: (catogry) {},
    catogries: CatogryDm.creatEventCatogries,
    selectedTabBg: Appcolor.blue,
    unselectedTabBg: Appcolor.white,
    selectedTabTextColor: Appcolor.white,
    unselectedTabTexrColor: Appcolor.blue,
  );

  buildTitleTextField() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        "Title",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Appcolor.black,
        ),
      ),
      SizedBox(height: 8),
      CustomTextField(hint: "Event Title", prefixicon: Appassets.titleIcon),
    ],
  );

  buildDescriptionTextField() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        "Description",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Appcolor.black,
        ),
      ),
      SizedBox(height: 8),
      CustomTextField(hint: "Event description", minLine: 5),
    ],
  );

  buildEventDate() => Row(
    children: [
      Icon(Icons.calendar_month),
      SizedBox(width: 10),
      Text(
        "Event Date",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Appcolor.black,
        ),
      ),
      Spacer(),
      Text(
        "Choose Date",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Appcolor.blue,
        ),
      ),
    ],
  );

  buildEventTime() => Row(
    children: [
      Icon(Icons.access_time),
      SizedBox(width: 10),
      Text(
        "Event Time",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Appcolor.black,
        ),
      ),
      Spacer(),
      Text(
        "Choose Time",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Appcolor.blue,
        ),
      ),
    ],
  );

  buildEventLocation() => Container();

  buildAddEventButton() => Container(
    padding: EdgeInsets.all(16),
    child: CustomBotton(text: "Add Event", onClick: () {}));
}
