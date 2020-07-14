import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


class NavigationAction extends Equatable {
  final int index;

  NavigationAction({@required this.index}) : super([index]);

  @override
  String toString() {
    // TODO: implement toString
    return 'pagetab: $index';
  }
}