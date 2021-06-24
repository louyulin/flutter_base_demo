import 'package:flutter/material.dart';
//flutter 页面声明周期

//flutter的 无状态widget 只有createElement build两个生命周期的方法
//StatefulWidget的声明周期方法按照时期不同可以分为三组
//1初始化时期 createState initState
//2更新时期 didChangeDependencies build  didUpDateWidget
//3销毁时期 deactivate dispose
class WidgetLifecycle extends StatefulWidget {
  //当我们构建一个新StatefulWidget 这个立即调用
  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _count = 0;

  @override
  void initState() {
    //类似android onCreate
    print('---initState---');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //在第一次 initState之后立即调用
    //当 InheritedWidget 改变之后再次调用这个方法
    print('---didChangeDependencies---');
    super.didChangeDependencies();
  }

  //didChangeDependencies执行之后调用 setState之后也会呗调用
  @override
  Widget build(BuildContext context) {
    print('---build---');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter页面声明周期'),
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: Text(
                '点我',
                style: TextStyle(fontSize: 26),
              ),
            ),
            Text(_count.toString())
          ],
        ),
      ),
    );
  }
}
