import 'dart:convert';

import 'package:flutter/material.dart';

class SocialPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Social Page Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SocialUserPage(),
    );
  }
}

class SocialUserPage extends StatelessWidget {
  SocialUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My page'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 16),
                height: 200,
                child: Row(
                  children: [
                    Expanded(
                      child: Placeholder(),
                      flex: 1,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Text(
                                'タイトル',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16, bottom: 16),
                              child: Text('サブタイトル'),
                            ),
                          ],
                        ),
                      ),
                      flex: 2,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: CircleAvatar(
                          child: Icon(Icons.account_circle),
                        ),
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Placeholder(),
                            flex: 1,
                          ),
                          Expanded(
                            child: Placeholder(),
                            flex: 1,
                          ),
                        ],
                      ),
                      flex: 7,
                    ),
                    Expanded(
                      child: Placeholder(),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Divider(
                height: 3,
                color: Colors.black12,
              ),
              Container(
                margin: EdgeInsets.all(16),
                alignment: Alignment.topLeft,
                child: Text(
                  '私は「そもそも」を考える\n.\n「問い」を細分化していく。'
                  '\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.'
                  '\n.\n.\n.\n#今日の学び #思考法 #問題解決 #イシュードリブン '
                  '#コミュニケーション #経営',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(
                height: 3,
                color: Colors.black12,
              ),
              Container(
                height: 40,
                margin: EdgeInsets.only(bottom: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: Placeholder(),
                      flex: 1,
                    ),
                    Expanded(
                      child: Placeholder(),
                      flex: 1,
                    ),
                    Expanded(
                      child: Placeholder(),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
