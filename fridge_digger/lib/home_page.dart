import 'package:flutter/material.dart';
import 'package:refrige_v1/pages/fifth_page.dart';
import 'package:refrige_v1/pages/first_page.dart';
import 'package:refrige_v1/pages/fourth_page.dart';
import 'package:refrige_v1/pages/third_page.dart';
import 'package:refrige_v1/pages/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Color PrimaryColor = Color.fromARGB(255, 112, 113, 114);
Color ScreenBackground = Color.fromARGB(255, 45, 48, 49);

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: const [
            FirstPage(),
            SecondPage(),
            ThirdPage(),
            FourthPage(),
            FifthPage()
          ],
        ), //follow index order
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          //currently showing tab
          onTap: (newIndex) {
            print("selected newIndex : $newIndex");
            // move to different page
            setState(() {
              currentIndex = newIndex;
            });
          },

          selectedItemColor: PrimaryColor,
          // 선택된 아이콘 색상
          unselectedItemColor: Colors.grey,
          // 선택되지 않은 아이콘 색상
          showSelectedLabels: false,
          // 선택된 항목 label 숨기기
          showUnselectedLabels: false,
          // 선택되지 않은 항목 label 숨기기
          type: BottomNavigationBarType.fixed,
          // 선택시 아이콘 움직이지 않기
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: 'Grocery',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'Freezer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen),
              label: 'Refrigerator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              label: 'Recipe',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sentiment_satisfied_alt),
              label: 'Roullete',
            ),
          ],
        ),
      ),
    );
  }
}
