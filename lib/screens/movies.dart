import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie/model/index.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/widgets/movie_card.dart';
import 'package:movie/widgets/movie_special_card.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Future<List<MovieModel>> _getData() async {
    String res =await DefaultAssetBundle.of(context).loadString("assets/movies.json");
    List<MovieModel>data= MovieModel.fromList(jsonDecode(res));
    Provider.of<CommonProvider>(context,listen: false).setMovies(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getData(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final _specialData = snapshot.data!.length > 3
                ? snapshot.data!.sublist(0, 5)
                : snapshot.data!;
            return SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Best movies",
                    style: TextStyle(color: Colors.white, fontSize: 25)),
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
                Text("All movies",
                    style: TextStyle(color: Colors.white, fontSize: 25)),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 10.0,
                  children: List.generate(snapshot.data!.length,
                      (index) => MovieCard(snapshot.data![index])),
                )
              ],
            ));
          } else {
            return Center(
                child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ));
          }
        }));
  }
}
