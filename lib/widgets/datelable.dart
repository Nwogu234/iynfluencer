import 'package:flutter/material.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:jiffy/jiffy.dart';

class DateLable extends StatefulWidget {
// ignore: use_key_in_widget_constructors
  const DateLable({required this.dateTime});

  final DateTime dateTime;

  @override
  State<DateLable> createState() => _DateLableState();
}

class _DateLableState extends State<DateLable> {
  late String dayInfo;

  @override
  void initState() {
    final createdAt = Jiffy.parseFromDateTime(widget.dateTime);
    final now = Jiffy.now();

    if (Jiffy.parseFromJiffy(createdAt).format(pattern: 'dd') ==
        now.format(pattern: 'dd')) {
      dayInfo = 'TODAY';
    }
    if (Jiffy.parseFromJiffy(createdAt).format(pattern: 'yMMMMd') ==
        now.subtract(days: 1).format(pattern: 'yMMMMd')) {
      dayInfo = 'YESTERDAY';
    } else if (Jiffy.parseFromJiffy(createdAt).isAfter(
      Jiffy.now().subtract(days: 7),
    )) {
      dayInfo = createdAt.EEEE;
    } else if (Jiffy.parseFromJiffy(createdAt).isAfter(
      Jiffy.now().subtract(years: 1),
    )) {
      dayInfo = createdAt.MMMd;
    } else {
      dayInfo = createdAt.MMMd;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 20.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: ColorConstant.gray200Ab,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 4.0,
            ),
            child: Text(
              dayInfo,
              style:  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: ColorConstant.gray900
              ),
            ),
          ),
        ),
      ),
    );
  }
}

