import 'package:flutter/material.dart';

class NotImplementedDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: const Text('Not Implemented'),
      content: const Text('This feature has not yet been implemented.'),
      actions: <Widget>[
        new FlatButton(
          onPressed: debugDumpApp,
          child: new Row(
            children: <Widget>[
              const Icon(
                Icons.dvr,
                size: 18.0,
              ),
              new Container(
                width: 8.0,
              ),
              const Text('DUMP APP TO CONSOLE'),
            ],
          ),
        ),
        new FlatButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: const Text('OH WELL'),
        ),
      ],
    );
  }
}