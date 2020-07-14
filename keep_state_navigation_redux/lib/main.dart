import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:keep_state_bottomnavigationbar/first_page.dart';
import 'package:keep_state_bottomnavigationbar/redux/action/navibar_action.dart';
import 'package:keep_state_bottomnavigationbar/redux/state/app_state.dart';
import 'package:keep_state_bottomnavigationbar/redux/store/app_store.dart';
import 'package:keep_state_bottomnavigationbar/second_page.dart';
import 'package:redux/redux.dart';
import 'first_page.dart';
import 'second_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var store = await createStore();
  runApp(Home(store));
}

class Home extends StatelessWidget {
  final Store<AppState> store;

  Home(this.store);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: MyHomePage(store),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Store<AppState> store;

  MyHomePage(this.store);

  @override
  _MyHomePageState createState() => _MyHomePageState(store);
}

class _MyHomePageState extends State<MyHomePage> {
  final Store<AppState> store;

  _MyHomePageState(this.store);

  int _selectedPage = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedPage].currentState.maybePop();
        print('isFistRouteCurrentTab: ${isFirstRouteInCurrentTab.toString()}');
        return isFirstRouteInCurrentTab;
      },
      child:
      StoreConnector<AppState,int>(
        converter:  (store) {
          return store.state.navigationSate.currentIndex;
        },
        builder: (context, currentIndex) {
          return Scaffold(
            bottomNavigationBar: StoreConnector<AppState, int>(
              converter: (store) {
                return store.state.navigationSate.currentIndex;
              },
              builder: (context, currentIndex) {
                return BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.phone_android),
                      title: Text('First Page'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.phone_android),
                      title: Text('Second Page'),
                    ),
                  ],
                  currentIndex: currentIndex,
                  selectedItemColor: Colors.blue,
                  onTap: (index) => _onItemTapped(index),
                );
              },
            ),
            body: Stack(
              children: [
                _buildOffstageNavigator(0),
                _buildOffstageNavigator(1),
              ],
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        },
      )
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      store.dispatch(NavigationAction(index: index));
    });
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          FirstPage(),
          SecondPage(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedPage != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        },
      ),
    );
  }
}
