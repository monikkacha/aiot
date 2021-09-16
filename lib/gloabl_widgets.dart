import 'package:aiot/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

enum WINNING_STATE { UP, DOWN, WINNER }

class GlobalWidgets {
  static Widget bar({var height, var count}) {
    var countStyle = TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28.0);
    var showingStyle =
        TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

    return Expanded(
        child: Container(
      height: height * 1.5,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.red.shade200,
          GlobalColors.cultured,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            style: countStyle,
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            "Showings",
            style: showingStyle,
          ),
        ],
      ),
    ));
  }

  static Widget winningBoardProfile(
      {@required var state,
      @required var number,
      @required var image,
      @required var name}) {
    return Expanded(
        child: Column(
      children: [
        Visibility(
          child: SizedBox(
            height: 12.0,
          ),
          visible: state == WINNING_STATE.DOWN || state == WINNING_STATE.UP,
        ),
        Visibility(
          child: Icon(Icons.arrow_drop_down),
          visible: state == WINNING_STATE.DOWN,
        ),
        Visibility(
          child: Text("" + number),
          visible: state == WINNING_STATE.DOWN || state == WINNING_STATE.UP,
        ),
        Visibility(
          child: Icon(Icons.arrow_drop_up),
          visible: state == WINNING_STATE.UP,
        ),
        Visibility(
          child: SizedBox(
            height: 6.0,
          ),
          visible: state != WINNING_STATE.WINNER,
        ),
        Visibility(
          child: Image.asset(
            AppImages.crown,
            height: 30.0,
            width: 30.0,
          ),
          visible: state == WINNING_STATE.WINNER,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 3.0),
              borderRadius: BorderRadius.circular(100.0)),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.fill),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          name,
          style: TextStyle(
              color: GlobalColors.philippine_gray, fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }
}
