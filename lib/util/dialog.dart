
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef Callback = void Function();

void dialog(String message, Callback success, Callback cancel) {
  Get.dialog(CupertinoAlertDialog(
    content: Text(message),
    actions: <Widget>[
      CupertinoDialogAction(
        child: Text('取消'),
        onPressed: () {
          navigator!.pop('ok');
        },
      ),
      CupertinoDialogAction(
        child: Text('确认'),
        onPressed: () {
          navigator!.pop('ok');
        },
      ),
    ],
  ));
}

void toast(String message,{Color color = Colors.blueAccent}) {
  Widget toast = Center(child:ConstrainedBox(
    constraints: BoxConstraints(maxHeight: 60, maxWidth: 300),
    child: Container(padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25.0),
        //color: Colors.greenAccent,
      ),child:Text(message,textAlign: TextAlign.center,softWrap: true,
            style: TextStyle(color:color)
        )),
  ));
  Get.showOverlay(
    opacityColor: Colors.transparent,
      asyncFunction: () async {
        return Future.delayed(Duration(seconds: 1));
      },
      loadingWidget: toast);
}