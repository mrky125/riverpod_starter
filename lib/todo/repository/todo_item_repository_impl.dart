import 'package:riverpod_starter/todo/entity/todo_item.dart';

import 'todo_item_repository.dart';

class TodoItemRepositoryImpl implements TodoItemRepository {
  @override
  Future<TodoItem> create({required String title,
      required String body,
      required bool isDone,
      required DateTime now
  }) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required int id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<TodoItem> find({required int id}) {
    // TODO: implement find
    throw UnimplementedError();
  }

  @override
  Future<List<TodoItem>> findAll({bool? viewCompletedItems}) {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<void> update({required TodoItem todoItem}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<void> updateIsDoneById({required int id, required bool isDone}) {
    // TODO: implement updateIsDoneById
    throw UnimplementedError();
  }

}