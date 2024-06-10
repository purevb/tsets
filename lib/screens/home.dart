import 'package:flutter/material.dart';
import 'package:movie/screens/movies.dart';
import 'package:movie/screens/profile.dart';
import 'package:movie/screens/wishlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;
  List<Widget> _totalPage = [MoviesPage(), WishListPage(), ProfilePage()];
  void _setCurrentIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
  // void _switcher(){
  //   setState(() {

  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0000),
      body: SafeArea(child: _totalPage[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: _setCurrentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Кино"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Дуртай"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профайл"),
        ],
      ),
    );
  }
}
