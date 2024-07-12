import 'package:flutter/material.dart';
import 'package:flutter_practice_yt/utils/tile.dart';
import 'package:hive/hive.dart';

import '../data/database.dart';
import '../utils/dialogbox.dart';

class Task extends StatefulWidget {
  Task({super.key});

  @override
  State<Task> createState() => _TodoListState();
}

class _TodoListState extends State<Task> {
  final _mybox = Hive.box('mybox');
  final _controller = TextEditingController();
  ListDatabase db = ListDatabase();

  @override
  void initState() {
    if (_mybox.get("TODOList") == null) {
      db.createdb();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void saveNewtask() {
    setState(() {
      db.dolist.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  void checkboxChange(bool? value, int index) {
    setState(() {
      db.dolist[index][1] = !db.dolist[index][1];
      db.updateData();
    });
  }

  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewtask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteIt(int index) {
    setState(() {
      db.dolist.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Todo List"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
        backgroundColor: Colors.amberAccent[400],
      ),
      drawer: Drawer(
        backgroundColor: Colors.amberAccent[400],
        child: Column(
          children: [
            const DrawerHeader(
              child: Icon(
                Icons.lightbulb_sharp,
                size: 48,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home,color: Colors.black),
              title: const Text(
                "Home",
                style: TextStyle(
                    color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/homepage');
              },
            ),
            const ListTile(
              leading: Icon(Icons.favorite,color: Colors.black,),
              title: Text("Favorites", style: TextStyle(color: Colors.white,fontSize: 20,
                  fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(Icons.settings,color: Colors.black),
              title:
                  const Text("Settings", style: TextStyle(color: Colors.white,fontSize: 20,
                      fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            )
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: db.dolist.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: db.dolist[index][0],
              taskCompl: db.dolist[index][1],
              onChanged: (value) => checkboxChange(value, index),
              deleteFunction: (context) => deleteIt(index),
            );
          }),
    );
  }
}
