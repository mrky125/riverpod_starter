import 'package:flutter/cupertino.dart';
import 'package:riverpod_starter/todo/entity/todo_item.dart';
import 'package:riverpod_starter/todo/repository/todo_item_repository.dart';

class TodoItemDetailModel extends ChangeNotifier {

  TodoItemDetailModel({
    required TodoItemRepository todoItemRepository,
  }) : _todoItemRepository = todoItemRepository;

  final TodoItemRepository _todoItemRepository;

  String? todoTitle = '';
  String todoBody = '';
  bool isDone = false;

  void setTodoItem(TodoItem todoItem) {
    todoTitle = todoItem.title;
    todoBody = todoItem.body;
  }

  Future<void> add() async {
    if (todoTitle == null || todoTitle!.isEmpty) {
      throw ArgumentError('タイトルを入力してください。');
    }
    await _todoItemRepository.create(
        title: todoTitle!, body: todoBody, isDone: isDone, now: DateTime.now());
    notifyListeners();
  }

  Future<void> update(int id) async {
    final todoItem = TodoItem(
      id: id,
      title: (todoTitle == null || todoTitle!.isEmpty) ? todoTitle = '' : todoTitle!,
      body: (todoBody.isEmpty) ? '' : todoBody,
      updatedAt: DateTime.now(),
    );
  }
}