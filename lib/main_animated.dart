import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Больше или меньше')),
      body: Center(
          child: Column(
        children: [
          RaisedButton(
              onPressed: () async {
                bool value = await Navigator.push(
                    context,
                    PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) => MyPopup(),
                        transitionsBuilder:
                            (___, Animation<double> animation, ____, Widget child) {
                          return FadeTransition(
                            opacity: animation,
                            child: ScaleTransition(scale: animation, child: child),
                          );
                        }));

                if (value)
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Больше'),
                    backgroundColor: Colors.green,
                  )); // TRUE
                else
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Меньше'),
                    backgroundColor: Colors.red,
                  )); // FALSE
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
            Navigator.pop(context, true);
          },
          child: Text('Больше'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context, false);
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
