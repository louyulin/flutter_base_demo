import 'package:flutter/material.dart';
import 'package:flutter_base_demo/plugin_use.dart';
import 'package:flutter_base_demo/statefull_group_page.dart';

import 'Flutter_layout_page.dart';
import 'less_group_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: RouteNavigator(),
      ),
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroupPage(),
        'ful': (BuildContext context) => StatefulGroup(),
        'plug': (BuildContext context) => PluginUse(),
        'layout': (BuildContext context) => FlutterLayoutPage()
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
          ),
          SwitchListTile(
              value: byName,
              title: Text('${byName?'':'不'}通过路由名跳转'),
              onChanged: (value) {
                setState(() {
                  byName = value;
                });
              }),
          _item('StatelessWidget组件基础', LessGroupPage(), 'less'),
          _item('StatefulWidget组件基础', StatefulGroup(), 'ful'),
          _item('plug使用', PluginUse(), 'plug'),
          _item('layout基础', FlutterLayoutPage(), 'layout'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if(byName){
            Navigator.pushNamed(context , routeName);
          }else{
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
