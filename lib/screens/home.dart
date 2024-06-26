import 'package:flutter/material.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/screens/movies.dart';
import 'package:movie/screens/profile.dart';
import 'package:movie/screens/wishlist.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
 HomePage({super.key});

  final List<Widget> _totalPage = [MoviesPage(), WishListPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: ((context, provider, child) {
      return Scaffold(
        backgroundColor: Color(0xff0000),
        body: SafeArea(child: _totalPage[provider.currentIdx]),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: provider.currentIdx,
          unselectedItemColor: Color.fromARGB(255, 145, 123, 172),
          selectedItemColor: Colors.white,
          onTap: provider.changeCurrentIdx,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.movie,
              ),
              label: "Movie", /*  */
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile"),
          ],
        ),
      );
    }));
  }
}
