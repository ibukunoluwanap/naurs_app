import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:naurs/models/todo.dart';
import 'package:naurs/utils/colors.dart';

Widget todoCard(Todo todoItem) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5.0),
    child: Slidable(
      endActionPane: const ActionPane(
        extentRatio: .2,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: _test,
            backgroundColor: green,
            foregroundColor: greenText,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0)),
            padding: EdgeInsets.all(15.0),
            icon: FontAwesomeIcons.squarePlus,
          ),
        ],
      ),
      child: ListTile(
        tileColor: red,
        textColor: redText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        title: Text(todoItem.title),
      ),
    ),
  );
}

void _test(BuildContext context) {}
