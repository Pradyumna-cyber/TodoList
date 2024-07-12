import 'package:flutter/material.dart';
import 'package:flutter_practice_yt/pages/do_task.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{

 await Hive.initFlutter();
 var box=await Hive.openBox('mybox');
  runApp( MyApp());

}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Task(),
      theme: ThemeData(primarySwatch: Colors.amber),

    );
  }
}