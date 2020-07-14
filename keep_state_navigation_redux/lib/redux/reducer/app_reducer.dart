import 'package:keep_state_bottomnavigationbar/redux/reducer/navigation_reducer/navigation_reducer.dart';
import 'package:keep_state_bottomnavigationbar/redux/state/app_state.dart';

AppState appReducer(AppState state, dynamic action) =>
    AppState(
        navigationReducer(state.navigationSate,action),
    );