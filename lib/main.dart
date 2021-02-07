import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Больше или меньше')),
      body: Center(
          child: Column(
        children: [
          RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) => MyPopup()));
              },
              child: Text('Загадать число')),
        ],
      )),
    );
  }
}

class MyPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ваш ответ:'),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Больше'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Меньше'),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(home: MainScreen()));
}
