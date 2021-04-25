import 'package:flutter/material.dart';
import 'package:flutter_app/authenticate/authenticate.dart';
import 'package:flutter_app/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // return home or Authenticate
    return Authenticate();
  }
}
