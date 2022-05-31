import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/inherited_page.dart';

void main() {
  // runApp(ProviderScope(
  //   child: CounterApp(),
  // ));
  runApp(MyApp());
}

// This redundant writing is below.
// final helloWorldProvider = Provider((ref) {
//   return 'Hello World';
// });
final helloProvider = Provider((ref) => 'Hello World');

class HelloApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloWorld = ref.watch(helloProvider);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(helloWorld),
        ),
      ),
    );
  }
}


///
/// Initial default app.
///
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InheritedHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
