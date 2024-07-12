import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ListDatabase{

  List dolist=[];
  final _mybox= Hive.box('mybox');

  void createdb(){
    dolist =[
      ["Mark your task",false],
      ["Do Exercise",false],
    ];
  }

  void loadData(){
    dolist=_mybox.get("TODOList");
  }


  void updateData(){
_mybox.put("TODOList", dolist);
  }
}