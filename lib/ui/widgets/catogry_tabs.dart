import 'package:evently/model/catogry_dm.dart';
import 'package:flutter/material.dart';

class CatogryTabs extends StatelessWidget {
  final List<CatogryDm> catogries;
  final Function(CatogryDm) onTabSelected;
  final Color selectedTabBg;
  final Color unselectedTabBg;
  final Color selectedTabTextColor;
  final Color unselectedTabTexrColor;

  const CatogryTabs({
    super.key,
    required this.onTabSelected,
    required this.catogries,
    required this.selectedTabBg,
    required this.unselectedTabBg,
    required this.selectedTabTextColor,
    required this.unselectedTabTexrColor,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: catogries
          .map((catogery) => mapCatogryDmToMap(catogery, false))
          .toList(),
    );
  }

  Widget mapCatogryDmToMap(CatogryDm catogory, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(37),
        color: isSelected? selectedTabBg : unselectedTabBg,
        border: Border.all(color: selectedTabBg)
      ),
      child: ,
    );
  }
}
