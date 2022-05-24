import 'package:floward_flutter/model/user.dart';
import 'package:flutter/material.dart';

userTile(User userdata, {required Function onClick}) {
  return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Card(
        elevation: 50,
        shadowColor: Colors.black,
        color: Colors.white,
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.green[500],
                    radius: 25,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          userdata.thumbnailUrl ?? ""), //NetworkImage
                      radius: 100,
                    ), //CircleAvatar
                  ), //CircleAvatar
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SizedBox
                        Text(
                          userdata.name ?? "",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.green[900],
                            fontWeight: FontWeight.w500,
                          ), //Textstyle
                        ),
                        Text(
                          "Post Count :" +
                              (userdata.posts == null
                                  ? "0"
                                  : userdata.posts!.length.toString()),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.green[900],
                          ), //Textstyle
                        ),
                      ])
                ]), //Text
                //SizedBox
                //Text
                //SizedBox
                //SizedBox
              ],
            ), //Column
          ), //Padding
        ), //SizedBox
      ));
}
