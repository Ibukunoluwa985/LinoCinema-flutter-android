import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MoviesApi {
  List movies = [];

  MoviesApi({this.movies});

  Future<void> moviesApi(context) async {
    try {
      Response response =
          await get('https://www.linocinema.com/movies/api/');
      if (response.statusCode == 200) {
        var moviesItems = jsonDecode(response.body);
        movies = moviesItems;
      } else {
        movies = [];
      }
    } on SocketException {
      return CircularProgressIndicator();
    }
  }
}