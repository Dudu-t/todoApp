import 'dart:convert';
import 'package:todoapp/App/todo/domain/entities/todo.dart';

class ToDoModel extends ToDo {
  final bool checked;
  final String name;
  final String uid;

  ToDoModel({
    required this.checked,
    required this.name,
    required this.uid,
  }) : super(checked: checked, name: name, uid: uid);

  ToDoModel copyWith({
    bool? checked,
    String? name,
    String? uid,
  }) {
    return ToDoModel(
      checked: checked ?? this.checked,
      name: name ?? this.name,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'checked': checked});
    result.addAll({'name': name});
    result.addAll({'uid': uid});

    return result;
  }

  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      checked: map['checked'] ?? false,
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoModel.fromJson(String source) =>
      ToDoModel.fromMap(json.decode(source));

  @override
  String toString() => 'ToDoModel(checked: $checked, name: $name, uid: $uid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ToDoModel &&
        other.checked == checked &&
        other.name == name &&
        other.uid == uid;
  }

  @override
  int get hashCode => checked.hashCode ^ name.hashCode ^ uid.hashCode;
}
