import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  NewScreen(this.userName, this.password);
  var userName, password;

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("$userName" + " " + "$password"));
  }
}
