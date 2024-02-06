import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c10_online/my_theme.dart';

class TaskListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: MyTheme.primaryColor,
            height: MediaQuery.of(context).size.height * 0.10,
            width: 4,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Task',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: MyTheme.primaryColor, fontWeight: FontWeight.bold),
              ),
              Text('Des', style: Theme.of(context).textTheme.titleMedium)
            ],
          )),
          Container(
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: MyTheme.primaryColor),
              child: Icon(
                Icons.check,
                color: MyTheme.whiteColor,
                size: 30,
              )),
        ],
      ),
    );
  }
}
