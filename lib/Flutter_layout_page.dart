import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//导入插件的头文件
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

void main() {
  runApp(FlutterLayoutPage());
}

class FlutterLayoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateFullGroupState();
  }
}

class _StateFullGroupState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 10);
    return MaterialApp(
        title: 'FlutterLayout开发',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('StateLessWidget与基础组件'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                //刷新
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  title: Text('首页'),
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.blue,
                  )),
              BottomNavigationBarItem(
                  title: Text('列表'),
                  icon: Icon(
                    Icons.list,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.list,
                    color: Colors.blue,
                  ))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Text('点我'),
          ),
          body: _currentIndex == 0
              ? RefreshIndicator(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipOval(
                                  child: Image.network(
                                    'http://www.devio.org/img/avatar.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: ClipRRect(
                                //圆角
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Opacity(
                                  opacity: 0.6,
                                  child: Image.network(
                                    'http://www.devio.org/img/avatar.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                            ),
                            Image.network(
                              'http://www.devio.org/img/avatar.png',
                              width: 100,
                              height: 100,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  hintText: '请输入',
                                  hintStyle: TextStyle(fontSize: 15)),
                            ),
                            Container(
                              height: 100,
                              margin: EdgeInsets.only(top: 10),
                              decoration:
                                  BoxDecoration(color: Colors.lightBlueAccent),
                              child: PageView(
                                children: <Widget>[
                                  _item('page', Colors.red),
                                  _item('page2', Colors.blue),
                                  _item('page3', Colors.green),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                    color: Colors.greenAccent,
                                    child: Text('宽度撑满'),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        // stack 和 positioned一起使用实现相对布局
                        children: <Widget>[
                          Image.network(
                            'http://www.devio.org/img/avatar.png',
                            width: 100,
                            height: 100,
                          ),
                          Positioned(
                              left: 0,
                              bottom: 0,
                              child: Image.network(
                                'http://www.devio.org/img/avatar.png',
                                width: 36,
                                height: 36,
                              )),
                        ],
                      ),
                      Wrap(
                        spacing: 5,//水平间距
                        runSpacing: 0,//垂直间距
                        children: <Widget>[
                          _chip('Flutter'),
                          _chip('进阶'),
                          _chip('实战'),
                          _chip('课程'),
                          _chip('app')
                        ],
                      )
                    ],
                  ),
                  onRefresh: _handleRefresh)
              : Column(
            children: <Widget>[
              Text('列表'),
             Expanded(child:  Container(
               color: Colors.red,
               child: Text('拉臣填满高度'),
             ))
            ],
          ),
        ));
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }

  _chip(String lable) {
    return Chip(
        label: Text(lable),
        avatar: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            lable.substring(0, 1),
            style: TextStyle(fontSize: 10),
          ),
        ));
  }
}
