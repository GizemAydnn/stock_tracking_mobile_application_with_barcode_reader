import 'package:flutter/material.dart';

Widget MenuCustomListItem(Color bgColor, Icon leadingIcon, Text title) {
  return Container(
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
          opacity: 0.2
        ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(18),
          width: 100,
          child: leadingIcon,
        ),
        title,
      ],
    ),
  );
}
