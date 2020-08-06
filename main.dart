import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

String x;

class MyApp extends StatelessWidget {
  web(cmd) async {
    print(cmd);
    var url = 'http://192.168.43.186/cgi-bin/$cmd.py';
    var r = await http.get(url);
    print(r.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Hi')),
      body: Center(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: 400,
            height: 300,
            color: Colors.grey,
            child: Column(
              children: <Widget>[
                Card(
                  child: TextField(
                    cursorColor: Colors.red,
                    autofocus: true,
                    style: TextStyle(height: 3),
                    decoration: InputDecoration(
                      hintText: 'ENTER CMD',
                      helperText: 'Date or Cal',
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (val) {
                      x = val;
                    },
                  ),
                ),
                Card(
                  child: FlatButton(
                    onPressed: () {
                      web(x);
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            )),
      ),
    ));
  }
}
