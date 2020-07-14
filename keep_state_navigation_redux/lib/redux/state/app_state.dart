
import 'package:keep_state_bottomnavigationbar/redux/state/navigation_state/navigation_state.dart';

class AppState {
  final NavigationState navigationSate;

  AppState(this.navigationSate);

  factory AppState.initial() {
    return AppState(
      NavigationState(0),
    );
  }

  AppState copyWith({
    NavigationState navigationSate,
  }) {
    return AppState(
      navigationSate ?? this.navigationSate,
    );
  }
}
