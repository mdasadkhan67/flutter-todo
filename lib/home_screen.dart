import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> todos = ['Go to Play'];

  //* Making TextEditingController to control the task adding [TextField]
  var taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: taskController, //* Attaching controller
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Task',
                  hintText: 'Write your task ...',
                  isDense: true),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      todos.removeAt(index);
                      setState(() {});
                    },
                  ),
                );
              })
        ]),
      ),
      // body: ListView(
      //   children: [
      //     for (int i = 0; i < todos.length; i++)
      //       Container(
      //         height: 200,
      //         child: ListTile(
      //           title: Text(todos[i]),
      //         ),
      //       )
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          todos.add(taskController.text);
          taskController.clear();
          setState(() {});
        },
      ),
    );
  }
}
