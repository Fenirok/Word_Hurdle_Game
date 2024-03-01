import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void showMsg(BuildContext context, String messege) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(messege),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(50),
      elevation: 30,
      duration: Duration(milliseconds: 1000),
    ));

void showResult({
  required BuildContext context,
  required String title,
  required String body,
  required VoidCallback onPlayAgain,
  required VoidCallback onCancel,
}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(body),
            actions: [
              TextButton(
                onPressed: onCancel,
                child: const Text('QUIT'),
              ),
              TextButton(
                onPressed: onPlayAgain,
                child: const Text('PLAY AGAIN'),
              ),
            ],
          ));
}
