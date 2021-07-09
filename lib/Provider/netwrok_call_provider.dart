import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hamad_tentwenty_assignment/data/coming_movies_api_data.dart';
import 'package:http/http.dart' as http;

class NetworkCall extends ChangeNotifier {
  ComingMoviesJsonParser jsonDataObj = new ComingMoviesJsonParser();
  List<Results> resultsLis = [];

  NetworkCall() {
    jsonDataObj.results = resultsLis;
  }

  setMoviesData(ComingMoviesJsonParser data) {
    jsonDataObj = data;
    notifyListeners();
  }

  ComingMoviesJsonParser getMoviesData() {
    return jsonDataObj;
  }

  Future<ComingMoviesJsonParser> callingAPi() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=badac1c2379511df5be4fdddcb7f872d');
    var response = await http.get(url);

    ComingMoviesJsonParser data = new ComingMoviesJsonParser.fromJson(json.decode(response.body));

    return data;
  }
}
