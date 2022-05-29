import 'package:floward_flutter/model/post.dart';
import 'package:flutter/material.dart';

postTile(Post postdata, {required Function onClick}) {
  return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Card(
        elevation: 50,

        shadowColor: Colors.black,
        color: Colors.white,

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: 
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //SizedBox
              Text(
                postdata.title ?? "",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green[900],
                  fontWeight: FontWeight.w500,
                ), //Textstyle
              ),
              Text(
                postdata.body!,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.green[900],
                ), //Textstyle
              ),
            ])
          , //Text
          //SizedBox
          //Text
          //SizedBox
          //SizedBox

          //Column
        ), //Padding
        //SizedBox
      ));
}
