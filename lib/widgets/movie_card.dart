
import 'package:flutter/material.dart';
import 'package:movie/model/index.dart';
import 'package:movie/screens/movie_detial.dart';

class MovieCard extends StatelessWidget {
  final MovieModel data;

  const MovieCard(this.data, {super.key});
  void onCardTap(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_)=>MovieDetailPage(data)));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 3 - 7;
    return InkWell(
      onTap: ()=>onCardTap(context),
      child: Column(
        children: [
          Container(
            width: width,
            height: width * 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage(data.imgUrl)),
            ),
          ),
          SizedBox(
              width: width,
              child: Text(
                data.title,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
