import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final countStateProvider = StateProvider((ref) => 0);

class CounterApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // これだとStateController<int>の変数になってしまい、onPressedで算術できない
    // final count = ref.watch(countStateProvider);
    final count = ref.watch(countStateProvider).state;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            '$count',
            style: TextStyle(fontSize: 40),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => ref.read(countStateProvider).state = count + 1,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
