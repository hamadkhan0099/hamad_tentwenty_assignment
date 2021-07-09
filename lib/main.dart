import 'package:flutter/material.dart';
import 'package:hamad_tentwenty_assignment/Provider/netwrok_call_provider.dart';
import 'package:hamad_tentwenty_assignment/screens/movies_list_screen.dart';
import 'package:hamad_tentwenty_assignment/utils/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<NetworkCall>.value(value: NetworkCall())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: comingMoviesAppTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoviesListScreen(),
    );
  }
}
