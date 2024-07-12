import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompl;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompl,
      required this.onChanged,
       required this.deleteFunction,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete_forever,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Checkbox(value: taskCompl, onChanged: onChanged),
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompl
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
