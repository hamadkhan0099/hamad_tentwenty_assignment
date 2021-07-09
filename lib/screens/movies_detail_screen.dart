import 'package:flutter/material.dart';
import 'package:hamad_tentwenty_assignment/utils/constants.dart';

class MoviesDetailScreen extends StatefulWidget {
  const MoviesDetailScreen({Key? key}) : super(key: key);

  @override
  _MoviesDetailScreenState createState() => _MoviesDetailScreenState();
}

class _MoviesDetailScreenState extends State<MoviesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.amber,
      appBar: new AppBar(
        title: new Text(moviesDetailAppTitle),
      ),
      body: new Column(
        children: [
          new Image.network("https://image.tmdb.org/t/p/original/620hnMVLu6RSZW6a5rwO8gqpt0t.jpg"),
        ],
      ),
    );
  }
}
