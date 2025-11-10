import 'package:evently/data/firestore_utilties.dart';
import 'package:evently/ui/widgets/event_widget.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: buildEventsList())

      ],
    );
  }

  Widget buildEventsList() => FutureBuilder(
    future: getFavoritEvents(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Center(child: Text(snapshot.error.toString()));
      } else if (snapshot.hasData) {
        var event = snapshot.data!;
        return ListView.builder(
          itemCount: event.length,
          itemBuilder: (context, index) {
            return EventWidget(eventDm: event[index], onfavClick: (){
              setState(() {
                
              });
            },);
          },
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  );
}
