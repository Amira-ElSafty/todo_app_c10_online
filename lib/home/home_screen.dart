import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c10_online/auth/login/login_screen.dart';
import 'package:flutter_app_todo_c10_online/home/settings/settings_tab.dart';
import 'package:flutter_app_todo_c10_online/home/task_list/add_task_bottom_sheet.dart';
import 'package:flutter_app_todo_c10_online/home/task_list/task_list_tab.dart';
import 'package:flutter_app_todo_c10_online/my_theme.dart';
import 'package:flutter_app_todo_c10_online/providers/auth_provider.dart';
import 'package:flutter_app_todo_c10_online/providers/list_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProviders>(context);
    var listProvider = Provider.of<ListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.20,
        actions: [
          IconButton(
              onPressed: () {
                listProvider.tasksList = [];
                authProvider.currentUser = null;
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              },
              icon: Icon(Icons.logout))
        ],
        title: Text(
          'ToDo List {${authProvider.currentUser!.name!}}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Task_List'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskBottomSheet();
        },
        child: Icon(Icons.add, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: selectedIndex == 0 ? TaskListTab() : SettingsTab(),
      // tabs[selectedIndex]
    );
  }

  List<Widget> tabs = [TaskListTab(), SettingsTab()];

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            side: BorderSide(color: MyTheme.blackColor, width: 2)),
        context: context,
        builder: (context) => AddTaskBottomSheet());
  }
}
