import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//导入插件的头文件
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

void main() {
  runApp(StatefulGroup());
}

class StatefulGroup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateFullGroupState();
  }
}

class _StateFullGroupState extends State<StatefulGroup> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 10);
    return MaterialApp(
        title: 'StateLessWidget与基础组件',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
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
              ?
          RefreshIndicator(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: <Widget>[
                            Image.network(
                              'http://www.devio.org/img/avatar.png',
                              width: 100,
                              height: 100,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(5, 0,0,0),
                                hintText: '请输入',
                                hintStyle: TextStyle(fontSize: 15)
                              ),
                            ),
                            Container(
                              height: 100,
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(color: Colors.lightBlueAccent),
                              child: PageView(
                                children: <Widget>[
                                  _item('page' , Colors.red),
                                  _item('page2' , Colors.blue),
                                  _item('page3' , Colors.green),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  onRefresh: _handleRefresh)
              : Text('另一个界面'),
        ));
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return null;
  }

  _item(String title , Color color){
    return Container(
      alignment: Alignment.center,
      child: Text(title , style: TextStyle(fontSize: 22 , color: Colors.white),),
    );
  }
}
