import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SeasonApi {
  List seasons = [];

  SeasonApi({this.seasons});

  Future<void> seasonApi(context) async {
    try {
      Response response =
          await get('https://www.linocinema.com/tvshows/season/api/');
      if (response.statusCode == 200) {
        var seasonItems = jsonDecode(response.body);
        seasons = seasonItems;
      } else {
        seasons = [];
      }
    } on SocketException {
      return CircularProgressIndicator();
    }
  }
}
