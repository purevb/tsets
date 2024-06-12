import 'package:flutter/material.dart';
import 'package:movie/model/index.dart';
import 'package:movie/providers/common.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel data;
  const MovieDetailPage(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Consumer<CommonProvider>(builder: ((context, provider, child) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    width: width,
                    height: width * 1.3,
                    child: Stack(
                      children: [
                        Image(
                          image: NetworkImage(data.imgUrl),
                          width: width,
                          fit: BoxFit.fitWidth,
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.3),
                        ),
                        Align(
                          alignment: Alignment(0.0, 0.9),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.play_circle_rounded,
                                color: Colors.white.withOpacity(0.8),
                                size: 50,
                              ),
                              SizedBox(height: 10),
                              Text(
                                data.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "${data.publishedYear} | ${data.durationMin} mins | ${data.type}",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 226, 224, 224),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed:()=>provider.addWishList(data.id),
                            icon: Icon(provider.isWishMovie(data) ? Icons.favorite:Icons.favorite_border,color: Colors.white,size: 40,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Story Line",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          data.description ?? "",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          child: Text("Buy Ticket"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );}));
  }
}
