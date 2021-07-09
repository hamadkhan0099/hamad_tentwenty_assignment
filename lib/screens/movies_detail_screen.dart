import 'package:flutter/material.dart';
import 'package:hamad_tentwenty_assignment/utils/constants.dart';

class MoviesDetailScreen extends StatefulWidget {
  final String posterLink;
  final String movieName;
  final String releaseDate;
  final String details;

  MoviesDetailScreen(
      {required this.posterLink,
      required this.movieName,
      required this.details,
      required this.releaseDate});

  @override
  _MoviesDetailScreenState createState() => _MoviesDetailScreenState();
}

class _MoviesDetailScreenState extends State<MoviesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        backgroundColor: Colors.amber,
        title: new Text(
          moviesDetailAppTitle,
          style: new TextStyle(color: Colors.black),
        ),
      ),
      body: new Column(
        children: [
          new Image.network(
            widget.posterLink,
            height: 200,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          new Text(
            widget.movieName,
            style: new TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 300,
            child: new ElevatedButton(
              onPressed: () {},
              child: new Text(
                "Watch Trailer",
                style: new TextStyle(color: Colors.black),
              ),
              style: bookingButtonStyle(),
            ),
          ),
          new SizedBox(
            height: 15,
          ),
          new Text(
            "Release Date",
            style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          new Text(
            widget.releaseDate,
            style: new TextStyle(
              fontSize: 18,
            ),
          ),
          new SizedBox(
            height: 15,
          ),
          new Text(
            "Overview",
            style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            child: new Text(
              widget.details,
              style: new TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
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
