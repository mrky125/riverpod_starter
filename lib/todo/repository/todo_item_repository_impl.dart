import 'package:riverpod_starter/todo/entity/todo_item.dart';
import 'package:riverpod_starter/todo/provider/database_provider.dart';

import 'todo_item_repository.dart';

class TodoItemRepositoryImpl implements TodoItemRepository {
  static String table = 'todo_item';
  static DatabaseProvider instance = DatabaseProvider.instance;

  @override
  Future<TodoItem> create(
      {required String title,
      required String body,
      required bool isDone,
      required DateTime now}) async {
    final row = <String, dynamic>{
      'title': title,
      'body': body,
      'createdAt': now.toString(),
      'updatedAt': now.toString(),
      'isDone': (isDone == true) ? 1 : 0,
    };
    final db = await instance.database;
    final id = await db.insert(table, row);
    return TodoItem(
        id: id,
        title: title,
        body: body,
        createdAt: now,
        updatedAt: now,
        isDone: isDone);
  }

  @override
  Future<void> delete({required int id}) async {
    final db = await instance.database;
    db.delete(table, where: 'id = ?', whereArgs: <int>[id]);
  }

  @override
  Future<TodoItem?> find({required int id}) async {
    final db = await instance.database;
    final rows =
        await db.rawQuery('select * from $table where id = ?', <int>[id]);
    if (rows.isEmpty) {
      return null;
    } else {
      return TodoItem.fromMap(rows.first);
    }
  }

  @override
  Future<List<TodoItem>?> findAll({bool? viewCompletedItems}) async {
    final db = await instance.database;
    final rows = (viewCompletedItems == null || viewCompletedItems)
        ? await db.rawQuery('select * from $table order by updatedAt desc')
        : await db.rawQuery(
            'select * from $table where isDone = 0 order by updatedAt desc');
    if (rows.isEmpty) {
      return null;
    } else {
      return rows.map((json) => TodoItem.fromMap(json)).toList();
    }
  }

  @override
  Future<void> update({required TodoItem todoItem}) async {
    final row = {
      'id': todoItem.id,
      'title': todoItem.title,
      'body': todoItem.body,
      'updatedAt': todoItem.updatedAt.toString(),
    };
    final db = await instance.database;
    await db.update(table, row, where: 'id = ?', whereArgs: <int>[todoItem.id]);
  }

  @override
  Future<void> updateIsDoneById({required int id, required bool isDone}) async {
    print('id=$id,isDone=$isDone');
    final row = {
      'id': id,
      'isDone': isDone ? 1 : 0,
    };
    final db = await instance.database;
    await db.update(table, row, where: 'id = ?', whereArgs: <int>[id]);
  }
}