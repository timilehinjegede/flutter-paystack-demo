import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDialogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  // success dialog
  static showSuccessDialog(BuildContext context, String content) {
    showDialog(
      context: context,
      builder: (context){
        return CupertinoAlertDialog(
          content: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.green,
                      width: 3,
                    ),
                  ),
                  child: Center(
                    child: Icon(Icons.check, color: Colors.green, size: 20,),
                  ),
                ),


                SizedBox(
                  height: 20,
                ),

                Text(
                  content,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  // error dialog
  static showErrorDialog(BuildContext context, String content) {
    showDialog(
        context: context,
        builder: (context){
          return CupertinoAlertDialog(
            content: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.red,
                        width: 3,
                      ),
                    ),
                    child: Center(
                      child: Icon(Icons.close, color: Colors.red, size: 20,),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
