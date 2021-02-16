import 'package:flutter/material.dart';
import 'package:forms_session_7_flutter/newScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _globalKey = GlobalKey<FormState>();
  var username, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _globalKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Username"),
                TextFormField(
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "UserName",
                    prefixIcon: Icon(Icons.ac_unit),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                  ),
                  // obscureText: true,
                  // obscuringCharacter: "-",
                  onChanged: (value) {
                    print(value);
                    username = value;
                  },

                  validator: (value) {
                    if (value.length < 4) {
                      print("value is less");
                      return "enter more value";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                Text("Password"),
                TextFormField(
                  obscureText: true,
                  // obscuringCharacter: "-",
                  onChanged: (value) {
                    print(value);
                    password = value;
                  },

                  validator: (value) {
                    if (value.length < 4) {
                      print("value is less");
                      return "enter more value";
                    }
                    return null;
                  },
                ),
                RaisedButton(
                    onPressed: () {
                      if (_globalKey.currentState.validate()) {
                        print("State is valid");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => NewScreen(username, password)));
                      }
                    },
                    child: Text("Button"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
