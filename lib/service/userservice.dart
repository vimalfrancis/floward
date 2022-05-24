import 'package:floward_flutter/model/user.dart';
import 'package:floward_flutter/service/api.dart';

class UserService extends API {
  Future<List<User?>?> getUserList() async {
    try {
      var response = await getDioInstance().get(
        "${url}users",
      );
      List<User> userList = userFromJson(response.data);

      return userList;
    } catch (e) {
      return null;
    }
  }
}
