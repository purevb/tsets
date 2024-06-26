import 'package:flutter/material.dart';
import 'package:movie/model/index.dart';
import 'package:movie/screens/movie_detial.dart';

class MovieSpecialCard extends StatelessWidget {
  final MovieModel data;

  const MovieSpecialCard(this.data, {super.key});
  void onCardTap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => MovieDetailPage(data)));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.4;
    return InkWell(
      onTap: ()=>onCardTap(context),
      child: Container(
        width: width,
        height: width * 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: NetworkImage(data.imgUrl))),
        child: Icon(
          Icons.play_arrow_sharp,
          color: Colors.white.withOpacity(0.9),
          size: 45,
        ),
      ),
    );
  }
}
