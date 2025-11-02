import 'package:evently/ui/screens/home/tabs/favorite/Favorite_tab.dart';
import 'package:evently/ui/screens/home/tabs/home/Home_tab.dart';
import 'package:evently/ui/screens/home/tabs/map/map_tab.dart';
import 'package:evently/ui/screens/home/tabs/profile/profile_tab.dart';
import 'package:evently/ui/utills/appassets.dart';
import 'package:evently/ui/utills/appcolor.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const MapTab(),
    const FavoriteTab(),
    const ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabs[currentIndex],
        floatingActionButton: buildFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  buildBottomNavigationBar() {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Appcolor.blue),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                currentIndex == 0
                    ? Appassets.ichomeActive
                    : Appassets.ichomeUnActive,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                currentIndex == 1
                    ? Appassets.icmapActive
                    : Appassets.icmapUnActive,
              ),
            ),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                currentIndex == 2
                    ? Appassets.icLoveActive
                    : Appassets.icLoveUnActive,
              ),
            ),
            label: "favorites",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                currentIndex == 3
                    ? Appassets.icProfileActive
                    : Appassets.icProfileUnActive,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget? buildFab() {
    return FloatingActionButton(
      shape: StadiumBorder(side: BorderSide(color: Appcolor.white)),
      backgroundColor: Appcolor.blue,
      child: const Icon(Icons.add),
      onPressed: () {},
    );
  }
}
