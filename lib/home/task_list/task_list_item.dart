import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c10_online/firebase_utils.dart';
import 'package:flutter_app_todo_c10_online/model/task.dart';
import 'package:flutter_app_todo_c10_online/my_theme.dart';
import 'package:flutter_app_todo_c10_online/providers/list_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class TaskListItem extends StatelessWidget {
  Task task;

  TaskListItem({required this.task});

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return Container(
      margin: EdgeInsets.all(10),
      child: Slidable(
        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          extentRatio: 0.25,
          // A motion is a widget used to control how the pane animates.
          motion: const DrawerMotion(),
          // All actions are defined in the children parameter.
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              onPressed: (context) {
                /// delete task
                FirebaseUtils.deleteTaskFromFireStore(task)
                    .timeout(Duration(milliseconds: 500), onTimeout: () {
                  print('task deleted succussfully');
                  listProvider.getAllTasksFromFireStore();
                });
              },
              backgroundColor: MyTheme.redColor,
              foregroundColor: MyTheme.whiteColor,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
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
                    task.title ?? '',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MyTheme.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(task.description ?? '',
                      style: Theme.of(context).textTheme.titleMedium)
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
        ),
      ),
    );
  }
}
