import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/models/todo_model.dart';

class ToDoDataBase{
  final _myBox = Hive.box<TodoModel>('todoBox');

  List<TodoModel> loadData(){
    return _myBox.values.toList();
  }


void addTodo(TodoModel todoModel){
    _myBox.add(todoModel);

}

}