import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c10_online/home/task_list/task_list_item.dart';
import 'package:flutter_app_todo_c10_online/my_theme.dart';

class TaskListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: MyTheme.blackColor,
            dayColor: MyTheme.blackColor,
            activeDayColor: MyTheme.whiteColor,
            activeBackgroundDayColor: MyTheme.primaryColor,
            dotsColor: MyTheme.whiteColor,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TaskListItem();
              },
              itemCount: 30,
            ),
          )
        ],
      ),
    );
  }
}
