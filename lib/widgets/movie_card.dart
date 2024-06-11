import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/model/index.dart';

class MovieCard extends StatelessWidget {
  final MovieModel data;

  const MovieCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width/3-7;
    return Column(
      children: [
        Container(
          width: width,
          height: width * 1.5,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(data.imgUrl)),
          ),
        ),
        SizedBox(
            width: width,
            child: Text(data.title, style: TextStyle(color: Colors.white),textAlign: TextAlign.center,))
      ],
    );
  }
}
