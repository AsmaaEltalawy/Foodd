import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/components/dialogebox.dart';
import 'package:to_do_app/components/todoraw.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/data/models/todo_model.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  List<TodoModel> todoList = [];

 var todoDatabase = ToDoDataBase();
  final _controller = TextEditingController();
final _myBox = Hive.box('todoBox');
 @override
  void initState() {
    super.initState();
   if(_myBox.isNotEmpty){
    todoList = todoDatabase.loadData();
   }
  }
  void oncheckboxchange(bool? value, int index) {
    setState(() {
      todoList[index].isCompleted = !todoList[index].isCompleted;
      _myBox.putAt(index, todoList[index]);
    }
    );
  }

  void savenewtask() {
setState(() {
  var newTask = TodoModel(title: _controller.text, isCompleted: false);
  todoList.add(newTask);
  todoDatabase.addTodo(newTask);
});
_controller.clear();
Navigator.pop(context);
  }

  void canceldialoge() {
    _controller.clear();
    Navigator.pop(context);
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogeBox(
            controller: _controller,
            onSave:savenewtask,
            onCancel:canceldialoge,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink,
        title: const Text(
          "To Do List",
          style: TextStyle(color: Colors.white),
        ),
      ), //AppBar
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: createNewTask,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(todoList[index].title),
              direction: DismissDirection.endToStart,
              onDismissed: (direction){
                setState(() {
                 todoList.removeAt(index);
                 _myBox.deleteAt(index);
                });
              },
              child: ToDoRaw(
                taskName: todoList[index].title,
                taskCompleted: todoList[index].isCompleted,
                onchanged: (value) => oncheckboxchange(value, index),
              ),
            );
          }),
    );
  }
}