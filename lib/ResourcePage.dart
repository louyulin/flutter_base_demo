import 'package:flutter/material.dart';

//导入插件的头文件
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

void main() {
  runApp(ResourcePage());
}

class ResourcePage extends StatefulWidget {
  @override
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('使用本地资源文件'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('image/avatar.png'),
              width: 100,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
