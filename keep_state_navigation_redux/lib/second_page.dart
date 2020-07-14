import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keep_state_bottomnavigationbar/third_page.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Second Page',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35.0,color: Colors.blue),
            ),
            RaisedButton(
              child: Text('move to third page'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ThirdPage()
                ));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        heroTag: null,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
