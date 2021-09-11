class TodoItem {
  TodoItem(
      {required this.id,
        required this.title,
        required this.body,
        this.createdAt,
        required this.updatedAt,
        this.isDone});

  final int id;
  String title;
  String body;
  final DateTime? createdAt;
  DateTime updatedAt;
  bool? isDone;

  // define getter
  int get getId => id;
  String get getTitle => '$title';
  String get getBody => '$body';
  DateTime get getUpdatedAt => updatedAt;

  // For interacting with local DB.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
      'createdAt': createdAt!.toUtc().toIso8601String(),
      'updatedAt': updatedAt.toUtc().toIso8601String(),
      'isDone': isDone! ? 1 : 0,
    };
  }

  // For interacting with local DB.
  factory TodoItem.fromMap(Map<String, dynamic> json) => TodoItem(
    id: json['id'] as int,
    title: json['title'] as String,
    body: json['body'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String).toLocal(),
    updatedAt: DateTime.parse(json['updatedAt'] as String).toLocal(),
    isDone: json['isDone'] == '1',
  );

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, createdAt: $createdAt}';
  }
}