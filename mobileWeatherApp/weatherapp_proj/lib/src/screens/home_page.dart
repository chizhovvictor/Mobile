import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weatherapp_proj/src/screens/currently_page.dart';
import 'package:weatherapp_proj/src/screens/today_page.dart';
import 'package:weatherapp_proj/src/screens/weekly_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController(); // Контроллер страниц

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage( // Переход на страницу
      index,
      duration: const Duration(microseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search location...',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            prefixIconColor: Colors.white70,
          ),
        ),
        actions: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            child: const VerticalDivider(
                color: Colors.white70), // Разделительная черта
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.location_on),
            color: Colors.white70,
          )
        ],
      ),
      body: PageView(  // Виджет для свайпинга страниц
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const <Widget>[
          CurrentlyPage(),
          TodayPage(),
          WeeklyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(  // Нижняя навигация
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Currently',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Weekly',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
