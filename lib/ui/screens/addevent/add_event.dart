import 'package:evently/data/firestore_utilties.dart';
import 'package:evently/model/catogry_dm.dart';
import 'package:evently/model/event_dm.dart';
import 'package:evently/model/user_dm.dart';
import 'package:evently/ui/utills/appassets.dart';
import 'package:evently/ui/utills/appcolor.dart';
import 'package:evently/ui/utills/dialog_utilites.dart';
import 'package:evently/ui/widgets/catogry_tabs.dart';
import 'package:evently/ui/widgets/custom_botton.dart';
import 'package:evently/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController titleControler = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  CatogryDm selectedCatogry = CatogryDm.creatEventCatogries[0];
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
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
              buildAddEventButton(),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() => AppBar(title: Text("Creat event"));

  buildCatogryImage() => ClipRRect(
    borderRadius: BorderRadiusGeometry.circular(16),
    child: Image.asset(selectedCatogry.image),
  );

  buildCatogryTab() => CatogryTabs(
    onTabSelected: (catogry) {
      selectedCatogry = catogry;
      setState(() {});
    },
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
      CustomTextField(
        hint: "Event Title",
        prefixicon: Appassets.titleIcon,
        controller: titleControler,
      ),
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
      CustomTextField(
        hint: "Event description",
        minLine: 5,
        controller: descriptionController,
      ),
    ],
  );

  buildEventDate() => InkWell(
    onTap: () async {
      selectedDate =
          (await showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            initialDate: selectedDate,
            lastDate: DateTime.now().add(Duration(days: 365)),
          )) ??
          selectedDate;
    },
    child: Row(
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
    ),
  );

  buildEventTime() => InkWell(
    onTap: () async {
      selectedTime =
          (await showTimePicker(context: context, initialTime: selectedTime)) ??
          selectedTime;
    },
    child: Row(
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
    ),
  );

  buildEventLocation() => Container();

  buildAddEventButton() => Container(
    padding: EdgeInsets.all(16),
    child: CustomBotton(
      text: "Add Event",
      onClick: () async {
        showLoading(context);
        selectedDate = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );
        EventDm eventDm = EventDm(
          ownerId: UserDm.currentUser!.id,
          id: "",
          title: titleControler.text,
          catogryId: selectedCatogry.title,
          date: selectedDate,
          description: descriptionController.text,
        );
        await addEventToFirestore(eventDm);
        Navigator.pop(context);
        Navigator.pop(context);
      },
    ),
  );
}
