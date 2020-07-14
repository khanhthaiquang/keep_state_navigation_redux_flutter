import 'package:keep_state_bottomnavigationbar/redux/reducer/app_reducer.dart';
import 'package:keep_state_bottomnavigationbar/redux/state/app_state.dart';
import 'package:redux/redux.dart';

Future <Store<AppState>> createStore() async {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: [],
  );
}