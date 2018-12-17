import 'package:flutter/material.dart';

import 'bloc.dart';

class BLoCProvider extends InheritedWidget {
  AppBLoC bLoC = AppBLoC('');

  BLoCProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static AppBLoC of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BLoCProvider) as BLoCProvider).bLoC;
  }
}
