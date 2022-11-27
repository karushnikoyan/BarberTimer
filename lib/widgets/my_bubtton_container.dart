import 'package:flutter/material.dart';

class MyButtonContainer extends StatelessWidget {
  Widget widget;
   MyButtonContainer({Key? key,required  this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(top: 34),
      child: Container(
        height: 60,
        width: 300,
        decoration: const BoxDecoration(
          // color: Colors.black54,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.black54,
            ],
          ),
        ),
        child: widget,
      ),
    );
  }
}
