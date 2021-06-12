import 'package:ebook_app_flutter_gogo/consttants.dart';
import 'package:ebook_app_flutter_gogo/screens/details_screen.dart';
import 'package:ebook_app_flutter_gogo/screens/home_screen.dart';
import 'package:ebook_app_flutter_gogo/vo/goalVO.dart';
import 'package:ebook_app_flutter_gogo/widgets/book_rating.dart';
import 'package:ebook_app_flutter_gogo/widgets/reading_card_list.dart';
import 'package:ebook_app_flutter_gogo/widgets/two_side_rounded_button.dart';
import 'package:flutter/material.dart';

import 'add.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var goalVOs = [
      GoalVO("홈런하고 도장받자", "인어공주 수영복", "2020-10-21 13:22", 30, 4),
      GoalVO("피아노 20분 치기", "정글이 밥 꽁짜", "2020-10-21 13:22", 20, 12),
      GoalVO("책 읽고 독후감 쓰기", "장난감 사주세요", "2020-10-21 13:22", 40, 33),
      GoalVO("한달 내리 골프치기", "몸 건강해 진다.", "2020-10-21 13:22", 50, 24),
      GoalVO("홈런하고 도장받자", "인어공주 수영복", "2020-10-21 13:22", 30, 11),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("칭찬해 (3/7)"),
        backgroundColor: Color(0xFF473F80),
        elevation: 0,
        // backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8, top: 0),
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 50.0,
                height: 100.0,
                child: GestureDetector(
                  onTap: () {
                    // _animationController.dispose();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen(),
                      ),
                    );
                  },
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    alignment: Alignment.centerRight,
                    icon: Icon(Icons.add),
                    color: Colors.white,
                    iconSize: 32,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => AddScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/main_page_bg.png"),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: goalVOs
                    .map((e) => bestOfTheDayCard(size: size, goalVO: e))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class bestOfTheDayCard extends StatelessWidget {
  final GoalVO goalVO;

  const bestOfTheDayCard({
    @required this.size,
    this.goalVO,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 205,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 24,
                top: 14,
                right: size.width * .35,
              ),
              height: 180,
              width: double.infinity,
              //width: size.width * 0.88,
              decoration: BoxDecoration(
                color: Color(0xFFEAEAEA).withOpacity(.45),
                borderRadius: BorderRadius.circular(29),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Text(
                  //   "New York Time Best For 11th March 2020",
                  //   style: TextStyle(
                  //     fontSize: 9,
                  //     color: kLightBlackColor,
                  //   ),
                  // ),
                  SizedBox(height: 5),
                  Text(
                    goalVO.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "선물 :  ",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                        TextSpan(
                          text: goalVO.presentName,
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "마지막 도전 : " + goalVO.lastCheckTime,
                    style: TextStyle(color: kLightBlackColor),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      BookRating(score: goalVO.goalCnt),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        size: 30,
                        color: Colors.blue,
                      ),
                      Icon(
                        Icons.star,
                        size: 30,
                        color: Colors.blue,
                      ),
                      Icon(Icons.star_half, size: 30, color: Colors.blue),
                      Icon(
                        Icons.star_border,
                        size: 30,
                        color: Colors.blue,
                      ),
                      Icon(
                        Icons.star_border,
                        size: 30,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          goalVO.nowStarCnt.toString(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: kLightBlackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              "assets/images/book-3.png",
              width: size.width * .37,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: InkWell(
              child: SizedBox(
                height: 40,
                width: size.width * .3,
                child: TwoSideRoundedButton(
                  text: "도장 꾹",
                  radious: 24,
                  press: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
