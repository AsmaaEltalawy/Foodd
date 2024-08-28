import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toodo/cubits/todo_cubit.dart';
import '../components/dialogebox.dart';
import '../components/todoraw.dart';

import '../data/model/todo_model.dart';

class Home extends StatelessWidget {


  final _controller = TextEditingController();

  Home({super.key});

  void saveNewTask(BuildContext context) {
  context.read<ToDoCubit>().addTodo(_controller.text);
    _controller.clear();
    Navigator.pop(context);
  }

  void canceldialoge(BuildContext context) {
    _controller.clear();
    Navigator.pop(context);
  }

  void createNewTask(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return DialogeBox(
            controller: _controller,
            onSave: () => saveNewTask(context),
            onCancel: ()=>canceldialoge(context),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              icon: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(.5)),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(Icons.settings),
                  )))
        ],
        elevation: 0,
        title: const Text(
          "To Do List",
        ),
      ), //AppBar
      floatingActionButton: FloatingActionButton(
        onPressed:()=> createNewTask(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<ToDoCubit,List<TodoModel>>(builder:(context,todoList){
        return ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(todoList[index].title),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  context.read<ToDoCubit>().deleteTodo(index);

                },
                child: ToDoRaw(
                  taskName: todoList[index].title,
                  taskCompleted: todoList[index].isCompleted,
                  onchanged: (value) => context.read<ToDoCubit>().updateTodo(index),
                ),
              );
            });
      } ),
    );
  }
}
