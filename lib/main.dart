import 'dart:async';

import 'package:flutter/material.dart';

import 'bloc.dart';

AppBLoC bloc = AppBLoC('');

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: bloc.stream,
      initialData: bloc.token,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        final authed = snapshot.data.length > 0;
        return Scaffold(
          appBar: AppBar(
            title: Text('BLoC Demo'),
          ),
          body: Center(
            child: RaisedButton(
              child: Text(authed ? '退出' : '登录'),
              onPressed: () {
                if (authed) {
                  bloc.destorySession();
                } else {
                  bloc.createSession('token');
                }
              },
            )
          ),
        );
      },
    );
  }
}
