import 'package:floward_flutter/model/post.dart';
import 'package:floward_flutter/service/api.dart';

class PostService extends API {
  Future<List<Post?>?> getPostsList() async {
    try {
      var response = await getDioInstance().get(
        "${url}posts",
      );
      return postFromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
