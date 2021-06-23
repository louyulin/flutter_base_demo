import 'package:flutter/material.dart';

//导入插件的头文件
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

void main() {
  runApp(LessGroupPage());
}

class LessGroupPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 60);
    return MaterialApp(
        title: 'StateLessWidget与基础组件',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('StateLessWidget与基础组件'),
          ),
          body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: <Widget>[
                Text(
                  'I am Text',
                  style: textStyle,
                ),
                Icon(Icons.android , size: 50, color: Colors.red,),
                CloseButton(),
                BackButton(),
                Chip(label: Text('testlable'),
                avatar: Icon(Icons.photo),)//chip是圆角
                ,Divider(height: 10,
                color: Colors.orange,),
                Card(
                  color: Colors.blue,
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text('I am Card' , style: textStyle,),
                  ),
                ),
                AlertDialog(
                  title: Text('dialogtitle'),
                  content: Text('2222'),
                )
              ],
            ),
          ),
        ));
  }
}
