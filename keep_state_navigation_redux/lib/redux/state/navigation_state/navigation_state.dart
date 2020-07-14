
import 'package:flutter/cupertino.dart';

@immutable
class NavigationState {
  final int currentIndex;

  NavigationState(this.currentIndex);

  NavigationState copyWith({currentIndex}) {
    return NavigationState(currentIndex ?? this.currentIndex);
  }

  factory NavigationState.initial() {
    return NavigationState(0);
  }
}