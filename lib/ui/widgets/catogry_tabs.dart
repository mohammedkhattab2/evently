import 'package:evently/model/catogry_dm.dart';
import 'package:flutter/material.dart';

class CatogryTabs extends StatefulWidget {
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
  State<CatogryTabs> createState() => _CatogryTabsState();
}

class _CatogryTabsState extends State<CatogryTabs> {
  late CatogryDm selectedCatogry;
  @override
  void initState() {
    super.initState();
    selectedCatogry = widget.catogries[0];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.catogries.length,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        isScrollable: true,
        onTap: (index) {
          selectedCatogry = widget.catogries[index];
          widget.onTabSelected(selectedCatogry);
          setState(() {});
        },
        tabs: widget.catogries
            .map(
              (catogery) =>
                  mapCatogryDmToMap(catogery, catogery == selectedCatogry),
            )
            .toList(),
      ),
    );
  }

  Widget mapCatogryDmToMap(CatogryDm catogory, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(10.5),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(37),
        color: isSelected ? widget.selectedTabBg : widget.unselectedTabBg,
        border: Border.all(color: widget.selectedTabBg, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            catogory.icon,
            color: isSelected
                ? widget.selectedTabTextColor
                : widget.unselectedTabTexrColor,
          ),
          SizedBox(width: 8),
          Text(
            catogory.title,
            style: TextStyle(
              color: isSelected
                  ? widget.selectedTabTextColor
                  : widget.unselectedTabTexrColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
