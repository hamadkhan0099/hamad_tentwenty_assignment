import 'package:flutter/material.dart';
import 'package:hamad_tentwenty_assignment/Provider/netwrok_call_provider.dart';
import 'package:hamad_tentwenty_assignment/data/coming_movies_api_data.dart';
import 'package:hamad_tentwenty_assignment/screens/movies_detail_screen.dart';
import 'package:hamad_tentwenty_assignment/utils/colors.dart';
import 'package:hamad_tentwenty_assignment/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({Key? key}) : super(key: key);

  @override
  _MoviesListScreenState createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  hitUpcomingMoviesApiWithProvider() async {
    ComingMoviesJsonParser moviesData =
        await Provider.of<NetworkCall>(context, listen: false).callingAPi();
    Provider.of<NetworkCall>(context, listen: false).setMoviesData(moviesData);
  }

  @override
  Widget build(BuildContext context) {
    hitUpcomingMoviesApiWithProvider();
    return new Scaffold(
      backgroundColor: mainBgColor,
      appBar: new AppBar(
        backgroundColor: Colors.amber,
        title: new Text(
          comingMoviesAppTitle,
          style: new TextStyle(color: Colors.black),
        ),
      ),
      body: new ListView.builder(
          itemCount: Provider.of<NetworkCall>(context, listen: true)
                      .getMoviesData()
                      .results!
                      .length ==
                  0
              ? 0
              : Provider.of<NetworkCall>(context, listen: true)
                  .getMoviesData()
                  .results!
                  .length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                new Row(
                  children: [
                    Image.network(
                      "https://image.tmdb.org/t/p/original/${Provider.of<NetworkCall>(context, listen: false).getMoviesData().results![index].posterPath}",
                      height: 100,
                      width: 60,
                    ),
                    new SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: new Column(
                        children: [
                          new Text(
                            Provider.of<NetworkCall>(context, listen: false)
                                .getMoviesData()
                                .results![index]
                                .title,
                            style: new TextStyle(fontSize: 16),
                            maxLines: 1,
                          ),
                          new Text(
                            Provider.of<NetworkCall>(context, listen: false)
                                .getMoviesData()
                                .results![index]
                                .releaseDate,
                            style: subTitlesStyle,
                          ),
                          new Text(
                            Provider.of<NetworkCall>(context, listen: false)
                                        .getMoviesData()
                                        .results![index]
                                        .adult ==
                                    false
                                ? "No Adult"
                                : "Adult",
                            style: subTitlesStyle,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: new SizedBox(
                      width: 10,
                    )),
                    new ElevatedButton(
                      style: bookingButtonStyle(),
                      child: new Text(
                        "Book",
                        style: new TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MoviesDetailScreen()));
                      },
                    ),
                    new SizedBox(
                      width: 10,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 15),
                  child: new Divider(
                    thickness: 1,
                  ),
                )
              ],
            );
          }),
    );
  }

  ButtonStyle bookingButtonStyle() {
    return ElevatedButton.styleFrom(
        primary: Colors.amber,
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ));
  }
}
