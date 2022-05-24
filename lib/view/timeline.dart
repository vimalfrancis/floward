import 'package:floward_flutter/model/user.dart';
import 'package:floward_flutter/view/widgets/postcard.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TimeLineScreen extends StatefulWidget {
  // ignore: constant_identifier_names
  static const PAGE = "TimeLineScreen";

  User? userData;

  TimeLineScreen({Key? key, this.userData}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => TimeLineState(userData: userData);
}

class TimeLineState extends State<TimeLineScreen> {
  User? userData;
  TimeLineState({this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: body(),
    );
  }

  body() {
    return SafeArea(
        child: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          expandedHeight: 160.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(userData!.name ?? ""),
            background: Image.network(
              userData!.url ?? "",
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
            child: Center(
              child: Text(''),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return postTile(userData!.posts![index]!, onClick: () {});
            },
            childCount: userData!.posts!.length,
          ),
        ),
      ],
    ));
  }
}
