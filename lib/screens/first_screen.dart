import 'package:flutter/material.dart';
import 'package:project_software1/screens/sports/sports_screen.dart';
import 'package:project_software1/screens/tips_screen/tips_screen.dart';

import 'diet_screen/diet_screen.dart';
import 'floating_action_button/floating_action_button_screen.dart';
import 'home_screen/home_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen> {
  int currentIndex = 0;
  var list = const [
    NewHomeScreen(),
    DietScreen(),
    TipsScreen(),
    SportsScreen(),
  ];
  var title = ["Home Screen", "Diet Screen", "Tips Screen", "SportsScreen"];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DietScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe9e9e9),
      appBar: AppBar(
        backgroundColor: const Color(0xff43c5df),
        title: Text(title[currentIndex]),
      ),
      body: list[currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff43c5df),
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const FloatingActionButtonScreen()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = NewHomeScreen();
                        currentIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home,
                            color: currentIndex == 0
                                ? const Color(0xffe9e9e9)
                                : const Color((0xff43c5df))),
                        Text(
                          "Home",
                          style: TextStyle(
                              color: currentIndex == 0
                                  ? const Color(0xffe9e9e9)
                                  : const Color((0xff43c5df))),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = DietScreen();
                        currentIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.no_food,
                            color: currentIndex == 1
                                ? const Color(0xffe9e9e9)
                                : const Color((0xff43c5df))),
                        Text(
                          "Diet",
                          style: TextStyle(
                              color: currentIndex == 1
                                  ? const Color(0xffe9e9e9)
                                  : const Color((0xff43c5df))),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = TipsScreen();
                        currentIndex = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.tips_and_updates,
                            color: currentIndex == 2
                                ? const Color(0xffe9e9e9)
                                : const Color((0xff43c5df))),
                        Text(
                          "Tips",
                          style: TextStyle(
                              color: currentIndex == 2
                                  ? const Color(0xffe9e9e9)
                                  : const Color((0xff43c5df))),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = SportsScreen();
                        currentIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sports_gymnastics,
                            color: currentIndex == 3
                                ? const Color(0xffe9e9e9)
                                : const Color((0xff43c5df))),
                        Text(
                          "Sport",
                          style: TextStyle(
                              color: currentIndex == 3
                                  ? const Color(0xffe9e9e9)
                                  : const Color((0xff43c5df))),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {});
          currentIndex = index;
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xff889be5),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.no_food, color: Color(0xff889be5)),
            label: "Diet",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tips_and_updates, color: Color(0xff889be5)),
            label: "Tips",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_gymnastics, color: Color(0xff889be5)),
            label: "Sport",
          ),
        ],
      ),*/
    );
  }
}
