import 'package:flutter/material.dart';

/// StatefulWidgetを継承したクラス
class StatefulHomePage extends StatefulWidget {
  StatefulHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _StatefulPageState createState() => _StatefulPageState();
}

// Stateを継承したクラス
class _StatefulPageState extends State<StatefulHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('_Message: build page, count: $_counter');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // 変数をコンストラクタで渡してしまうので、constでラップできない
          children: <Widget>[
            _Label(),
            _Message(_counter), // カウント数を表示
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

/// ただのラベルテキスト
class _Label extends StatelessWidget {
  const _Label({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('_Message: build label');
    return Text(
      'You have pushed the button this many times:',
    );
  }
}

/// 変更があったらリビルドしたいテキスト
class _Message extends StatelessWidget {
  const _Message(
    this._count, {
    Key? key,
  }) : super(key: key);

  final int _count;

  @override
  Widget build(BuildContext context) {
    print('_Message: build count text, count: $_count');
    return Text(
      '$_count',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}