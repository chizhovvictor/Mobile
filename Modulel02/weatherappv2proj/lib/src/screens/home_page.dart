import 'package:flutter/material.dart';
import 'package:weatherappv2proj/src/screens/currently_page.dart';
import 'package:weatherappv2proj/src/screens/today_page.dart';
import 'package:weatherappv2proj/src/screens/weekly_page.dart';
import 'package:weatherappv2proj/src/widgets/bottom_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController(); // Контроллер страниц
  final _textController = TextEditingController();

  String inputTextField = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      // Переход на страницу
      index,
      duration: const Duration(microseconds: 300),
      curve: Curves.ease,
    );
  }

  void handleValue(String value) {
    setState(() {
      inputTextField = value;
    });
  }

  void onGeolocationPressed() {
    setState(() {
      inputTextField = 'Geolocation';
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: TextField(
          controller: _textController,
          onSubmitted: handleValue,
          style: const TextStyle(color: Colors.white70),
          decoration: const InputDecoration(
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
            onPressed: onGeolocationPressed,
            icon: const Icon(Icons.location_on),
            color: Colors.white70,
          )
        ],
      ),
      body: PageView(
        // Виджет для свайпинга страниц
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          CurrentlyPage(input: inputTextField),
          TodayPage(input: inputTextField),
          WeeklyPage(input: inputTextField),
        ],
      ),
      bottomNavigationBar: BottomMenu(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
