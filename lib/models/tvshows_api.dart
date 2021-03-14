import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TvshowsApi {
  List tvshows = [];

  TvshowsApi({this.tvshows});

  Future<void> tvshowApi(context) async {
    try {
      Response response = await get('https://www.linocinema.com/tvshows/api/');
      if (response.statusCode == 200) {
        var tvshowItems = jsonDecode(response.body);
        tvshows = tvshowItems;
      } else {
        tvshows = [];
      }
    } on SocketException {
      return CircularProgressIndicator();
    }
  }
}
