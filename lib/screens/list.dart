import 'package:ebook_app_flutter_gogo/consttants.dart';
import 'package:ebook_app_flutter_gogo/screens/details_screen.dart';
import 'package:ebook_app_flutter_gogo/screens/home_screen.dart';
import 'package:ebook_app_flutter_gogo/widgets/book_rating.dart';
import 'package:ebook_app_flutter_gogo/widgets/reading_card_list.dart';
import 'package:ebook_app_flutter_gogo/widgets/two_side_rounded_button.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
        title: Text("칭찬해 (3/7)"),
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
                    child:
                    // IconButton(
                    //   padding: EdgeInsets.all(0),
                    //   alignment: Alignment.centerRight,
                    //   icon: Icon(Icons.add),
                    //   color: Colors.red[500],
                    //   onPressed: (){},
                    // ),
                    Text(
                      '+',
                      style: TextStyle(color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w400),
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
                children: <Widget>[
                  SizedBox(height: size.height * .1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: RichText(
                      text: TextSpan(
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline4,
                        children: [
                          TextSpan(text: "What are you \nreading "),
                          TextSpan(
                            text: "today?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  bestOfTheDayCard(size: size),
                  bestOfTheDayCard(size: size),
                  bestOfTheDayCard(size: size),
                  bestOfTheDayCard(size: size),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class bestOfTheDayCard extends StatelessWidget {
  const bestOfTheDayCard({
    Key key,
    @required this.size,
  }) : super(key: key);

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
                top: 24,
                right: size.width * .35,
              ),
              height: 185,
              width: double.infinity,
              //width: size.width * 0.88,
              decoration: BoxDecoration(
                color: Color(0xFFEAEAEA).withOpacity(.45),
                borderRadius: BorderRadius.circular(29),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "New York Time Best For 11th March 2020",
                    style: TextStyle(
                      fontSize: 9,
                      color: kLightBlackColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "문제집 풀면 스티커~ 칭찬해",
                    style: Theme
                        .of(context)
                        .textTheme
                        .title,
                  ),
                  Text(
                    "Gary Venchuk",
                    style: TextStyle(color: kLightBlackColor),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      BookRating(score: 4.9),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "When the earth was flat and everyone wanted to win",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
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
        ],
      ),
    );
  }
}
