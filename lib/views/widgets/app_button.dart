import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String content;

  AppButton({this.onTap, this.content});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: FlatButton(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: onTap,
        child: Center(
          child: Text(content),
        ),
      ),
    );
  }
}
