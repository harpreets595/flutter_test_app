import 'package:flutter/material.dart';
import 'package:flutter_app/authenticate/authenticate.dart';
import 'package:flutter_app/home/home.dart';
import 'package:flutter_app/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user  = Provider.of<TheUser>(context);
    print(user);

    // return home or Authenticate
    return user == null ? Authenticate() : Home();
    return Authenticate();
  }
}
