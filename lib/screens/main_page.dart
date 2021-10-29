import 'package:fitness_app/common/const/color_const.dart';
import 'package:fitness_app/screens/exercises_page.dart';
import 'package:fitness_app/screens/profile_page.dart';
import 'package:fitness_app/screens/schedule_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    openPage(int index){
      switch (index) {
        case 0: return ExercisesPage();
        case 1: return SchedulePage();
        case 2: return ProfilePage();
        default: return ExercisesPage();
      }
    }

    return Scaffold(
      backgroundColor: AppColor.mainBackColor,
      appBar: AppBar(
        backgroundColor: AppColor.mainBackColor,
        title: const Text('gain'),
        leading: const Icon(
          Icons.fitness_center,
        ), 
      ),
      body: openPage(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Упражнении'),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'График'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль')
        ],
        currentIndex: selectedIndex,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        onTap: (int index){
          setState(() => selectedIndex = index);
        }
      ),
    );
  }
}

