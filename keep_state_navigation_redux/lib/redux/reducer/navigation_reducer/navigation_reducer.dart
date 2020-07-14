import 'package:keep_state_bottomnavigationbar/redux/action/navibar_action.dart';
import 'package:keep_state_bottomnavigationbar/redux/state/navigation_state/navigation_state.dart';
import 'package:redux/redux.dart';

final navigationReducer = combineReducers<NavigationState>([
  TypedReducer<NavigationState, NavigationAction>(_selectItemAction),
]);

NavigationState _selectItemAction(NavigationState state, NavigationAction action) {
  return state.copyWith(currentIndex: action.index);
}