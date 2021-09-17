import 'dart:ui';

import 'package:aiot/app_images.dart';
import 'package:aiot/colors.dart';
import 'package:aiot/gloabl_widgets.dart';
import 'package:aiot/winning_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabScreen extends StatelessWidget {
  var scoreList = [
    WinningModel("4", "27", WINNING_STATE.UP, AppImages.image_1, "Roger Hulg"),
    WinningModel(
        "6", "23", WINNING_STATE.DOWN, AppImages.image_2, "Hilman Nuris"),
    WinningModel(
        "1", "19", WINNING_STATE.UP, AppImages.image_3, "Eric Lawrence"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                width: 280.0,
                child: Row(
                  children: [
                    GlobalWidgets.winningBoardProfile(
                        state: WINNING_STATE.UP,
                        number: "2",
                        image: AppImages.image_1,
                        name: "Joe West"),
                    GlobalWidgets.winningBoardProfile(
                        state: WINNING_STATE.WINNER,
                        number: "2",
                        image: AppImages.image_2,
                        name: "John Doe"),
                    GlobalWidgets.winningBoardProfile(
                        state: WINNING_STATE.DOWN,
                        number: "3",
                        image: AppImages.image_3,
                        name: "John Brown"),
                  ],
                ),
              ),
              Container(
                height: 200.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(AppImages.bar_png),
                    GlobalWidgets.scoreBoard(
                        firstRank: "38", secondRank: "34", thirdRank: "29"),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: scoreList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var icon = Icons.arrow_drop_down;
                    icon = scoreList[index].state == WINNING_STATE.UP
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border:
                                Border.all(color: GlobalColors.chinese_silver)),
                        height: 60.0,
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(scoreList[index].number),
                                Icon(icon)
                              ],
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                image: DecorationImage(
                                    image: NetworkImage(scoreList[index].image),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Text(
                              scoreList[index].name,
                              style: TextStyle(
                                  color: GlobalColors.philippine_gray,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              scoreList[index].score,
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ],
      ),
    );
  }
}
