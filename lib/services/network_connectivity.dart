import 'package:connectivity/connectivity.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter/material.dart';

Future<bool> checkConnectivity(context) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    // I am connected to a mobile network.
    print("internet available");
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    // I am connected to a wifi network.
    print("internet  available");
    return true;
  } else if (connectivityResult == ConnectivityResult.none) {
    // I am connected to a wifi network.
    print("internet not available");
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              elevation: 16,
              titleTextStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              contentTextStyle: TextStyle(color: Colors.white),
              backgroundColor: Colors.black,
              title: Text('CONNECTION'),
              content: Text(
                'No internet connection. Please check your internet connection and reload.',
              ),
              actions: [
                TextButton(
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Phoenix.rebirth(context);
                  },
                )
              ],
            ));
  } else {
    print("internet not available");
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              elevation: 16,
              titleTextStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              contentTextStyle: TextStyle(color: Colors.white),
              backgroundColor: Colors.black,
              title: Text('CONNECTION'),
              content: Text(
                'No internet connection. Please check your internet connection and reload.',
              ),
              actions: [
                TextButton(
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Phoenix.rebirth(context);
                  },
                )
              ],
            ));
  }
}
