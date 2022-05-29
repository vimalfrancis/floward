import 'package:floward_flutter/model/user.dart';
import 'package:floward_flutter/provider/userlistscreenprovider.dart';
import 'package:floward_flutter/view/timeline.dart';
import 'package:floward_flutter/view/widgets/drawer.dart';
import 'package:floward_flutter/view/widgets/usercard.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatefulWidget {
  static const PAGE = 'UserListScreen';

  const UserListScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => UserListState();
}

class UserListState extends State<UserListScreen> {
  @override
  // ignore: must_call_super
  void initState() {
    Future.microtask(() {
      context.read<UserProvider>().getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: customedrawer(context),
      appBar: AppBar(
        title: Text('UserListTitle'.tr()),
      ),
      body: body(),
    );
  }

  body() {
    List<User?>? userData = context.watch<UserProvider>().userListResponse;

    if (context.read<UserProvider>().isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return SafeArea(
          child: ListView.builder(
              itemCount: userData == null ? 0 : userData.length,
              itemBuilder: (_, index) {
                return userTile(userData![index]!, onClick: () {
                  Navigator.pushNamed(_, TimeLineScreen.PAGE,
                      arguments: TimeLineScreen(
                        userData: userData[index],
                      ));
                });
              }));
    }
  }
}
