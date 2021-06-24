import 'package:flutter/material.dart';
import 'package:flutter_base_demo/plugin_use.dart';
import 'package:flutter_base_demo/statefull_group_page.dart';

import 'Flutter_layout_page.dart';
import 'ResourcePage.dart';
import 'flutter_widget_lifecycle.dart';
import 'gesture_page.dart';
import 'less_group_page.dart';
import 'luanch_page.dart';

void main() {
  runApp(DynamicTheme());
}

class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness brightness = Brightness.dark;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: brightness,
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  if (brightness == Brightness.dark) {
                    brightness = Brightness.light;
                  } else {
                    brightness = Brightness.dark;
                  }
                });
              },
              child: Text('切换主图'),
            ),
            RouteNavigator()
          ],
        ),
      ),
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroupPage(),
        'ful': (BuildContext context) => StatefulGroup(),
        'plug': (BuildContext context) => PluginUse(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'gensture': (BuildContext context) => GesturePage(),
        'resourcepage': (BuildContext context) => ResourcePage(),
        'launchpage': (BuildContext context) => LaunchPage(),
        'lifecylepage': (BuildContext context) => WidgetLifecycle(),
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
              title: Text('${byName ? '' : '不'}通过路由名跳转'),
              onChanged: (value) {
                setState(() {
                  byName = value;
                });
              }),
          _item('StatelessWidget组件基础', LessGroupPage(), 'less'),
          _item('StatefulWidget组件基础', StatefulGroup(), 'ful'),
          _item('plug使用', PluginUse(), 'plug'),
          _item('layout基础', FlutterLayoutPage(), 'layout'),
          _item('gesturepage手势使用', GesturePage(), 'gensture'),
          _item('资源文件使用', ResourcePage(), 'resourcepage'),
          _item('打开第三方app', LaunchPage(), 'launchpage'),
          _item('Flutter生命周期', WidgetLifecycle(), 'lifecylepage'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
