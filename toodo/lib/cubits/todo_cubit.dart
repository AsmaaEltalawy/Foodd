import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:toodo/data/model/todo_model.dart';

class ToDoCubit extends Cubit<List<TodoModel>> {
  final Box<TodoModel> _todoBox;

  ToDoCubit(this._todoBox) : super([]){
    loadTodos();
  }

  void loadTodos() {
    if (_todoBox.isNotEmpty) {
      emit(_todoBox.values.toList());
    }
  }

  void addTodo(String title) {
    final newTask = TodoModel(title: title, isCompleted: false);
    _todoBox.add(newTask);

    emit([...state, newTask]);// spread operator
    print(state);
  }

  void updateTodo(int index) {
    state[index].isCompleted = !state[index].isCompleted;
    _todoBox.putAt(index, state[index]);
    emit([...state]);
  }

  void deleteTodo(int index) {
    _todoBox.deleteAt(index);
    emit([...state]..removeAt(index));
  }
}
