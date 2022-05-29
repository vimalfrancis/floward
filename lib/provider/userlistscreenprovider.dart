import 'package:floward_flutter/model/post.dart';
import 'package:floward_flutter/model/user.dart';
import 'package:floward_flutter/service/postservice.dart';
import 'package:floward_flutter/service/userservice.dart';
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  List<User?>? userListResponse;
  List<Post?>? postListResponse;

  bool isLoading = false;

  Future<void>getData()async
  {
    isLoading = true;
    notifyListeners();
    try{
    Future.wait([getUserList(),getPostList()],eagerError: true).then((value) {
    isLoading = false;
    mergPost();
    });
    } catch(e){
       print(e);
    }
  }

  Future<void> getUserList() async {
    isLoading = true;
    notifyListeners();
    try {
      userListResponse = await UserService().getUserList();
      getPostList();
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getPostList() async {
    try {
      isLoading = true;
      postListResponse = await PostService().getPostsList();
      isLoading = false;
      mergPost();
    } catch (e) {
      debugPrint(e.toString());
      isLoading = false;
      notifyListeners();
    }
  }

  mergPost() {
    userListResponse?.forEach((userElement) {
      postListResponse!.forEach((postElement) {
        if (userElement!.userId == postElement!.userId) {
          userElement.posts!.add(postElement);
        }
      });
    });

    notifyListeners();
  }
}
