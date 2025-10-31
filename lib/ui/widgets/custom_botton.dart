import 'package:evently/ui/utills/appcolor.dart';
import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  final Color backGroundcolor;
  final String text;
  final Function() onClick;
  final Color textColor;
  final Widget? icon;
  const CustomBotton({
    super.key,
    this.backGroundcolor = Appcolor.blue,
    required this.text,
    required this.onClick,
    this.textColor = Appcolor.white,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(backgroundColor: backGroundcolor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) icon!,
          Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
