import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie/model/index.dart';
import 'package:movie/widgets/movie_special_card.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Future<List<MovieModel>> _getData() async {
    String res= await DefaultAssetBundle.of(context).loadString("assets/movies.json");
    return MovieModel.fromList(jsonDecode(res));
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getData(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final  _specialData =snapshot.data!.length > 3 ?snapshot.data!.sublist(0, 5) : snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Best movies", style: TextStyle(color: Colors.white)),
                SizedBox(
                  height: 200,
                  //\\ width: ,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(_specialData.length,
                          (index) => MovieSpecialCard(_specialData[index])),
                    ),
                  ),
                ),
                Text("All movies", style: TextStyle(color: Colors.white)),
                Wrap(
                  children: [],
                )
              ],
            );
          }else{
              return Center(child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(),
              ));
            }
        }));
  }
}
