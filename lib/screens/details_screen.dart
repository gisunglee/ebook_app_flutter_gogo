import 'package:ebook_app_flutter_gogo/consttants.dart';
import 'package:ebook_app_flutter_gogo/widgets/book_rating.dart';
import 'package:ebook_app_flutter_gogo/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  height: size.height * .5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: size.height * .1),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Crushing &",
                                    style: Theme.of(context).textTheme.display1,
                                  ),
                                  Text(
                                    "Influence",
                                    style: Theme.of(context)
                                        .textTheme
                                        .display1
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "When the earth was flat and everyone wanted to win When the",
                                              maxLines: 5,
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: kLightBlackColor,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            RoundedButton(
                                              text: "Read",
                                              verticalPadding: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(Icons.favorite_border),
                                            onPressed: () {},
                                          ),
                                          BookRating(
                                            score: 4.9,
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              "assets/images/book-1.png",
                              height: 200,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
