import 'package:flutter/material.dart';

/// StatefulWidgetを継承させる
class InheritedHomePage extends StatefulWidget {
  const InheritedHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _InheritedPageState createState() => _InheritedPageState();
}

/// State
class _InheritedPageState extends State<InheritedHomePage> {
  var _counter = 1;

  @override
  Widget build(BuildContext context) {
    // カウントが変わればリビルドされる
    print('_Message: build page, count: $_counter');
    // InheritedWidget
    return _Inherited(
      data: this,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // const定義できる
            // _Labelは変更と関わらないのでリビルドしない、_Messageは変更によりリビルドする
            children: const <Widget>[
              _Label(),
              _Message(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => _counter++),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

/// InheritedWidgetを継承したクラス
class _Inherited extends InheritedWidget {
  // 状態（データ）とウィジェットを受け取る
  const _Inherited({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final _InheritedPageState data;

  /// 変更を通知するか → _HomePageState
  @override
  bool updateShouldNotify(_Inherited old) => true;

  /// 状態を取得できるようにウィジェットへアクセスさせる関数
  static _InheritedPageState of(
      BuildContext context, {
        required bool listen,
      }) {
    return listen
        ? context.dependOnInheritedWidgetOfExactType<_Inherited>()!.data
        : (context.getElementForInheritedWidgetOfExactType<_Inherited>()!.widget
    as _Inherited)
        .data;
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
  const _Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _count = _Inherited.of(
      context,
      listen: true, // 変更監視して、変わったらリビルド
    )._counter;
    print('_Message: build count text, count: $_count');
    return Text(
      '$_count',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
