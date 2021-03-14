import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ExploresApi {
  List explores = [];

  ExploresApi({this.explores});

  Future<void> exploresApi(context) async {
    try {
      Response response =
          await get('https://www.linocinema.com/explore/api/');
      if (response.statusCode == 200) {
        var newsFeedCriticItems = jsonDecode(response.body);
        explores = newsFeedCriticItems;
      } else {
        explores = [];
      }
    } on SocketException {
      return CircularProgressIndicator();
    }
  }
}
