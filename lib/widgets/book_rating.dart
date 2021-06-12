import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consttants.dart';

class BookRating extends StatelessWidget {
  final int score;

  const BookRating({
    Key key,
    this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 7),
            blurRadius: 20,
            color: Color(0xFD3D3D3).withOpacity(.5),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 5),
          Text(
            "도전",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: kLightBlackColor
            ),
          ),
          Text(
            score.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange
            ),
          ),
        ],
      ),
    );
  }
}
