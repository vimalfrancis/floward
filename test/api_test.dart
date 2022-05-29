import 'package:floward_flutter/model/post.dart';
import 'package:floward_flutter/model/user.dart';
import 'package:floward_flutter/service/postservice.dart';
import 'package:floward_flutter/service/userservice.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'api_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('getuserlist', () {
    test('returns an Post list if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client
              .get(Uri.parse('https://my-json-server.typicode.com/SharminSirajudeen/test_resources/posts')))
          .thenAnswer((_) async =>
              http.Response('[{"userId": 1,"id": 1,"title": "dolorem eum magni eos aperiam quia","body": "mocktext"}]', 200));

      expect(await PostService().getPostsList(), isA<List<Post?>?>());
    });

    test('returns an User list if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client
              .get(Uri.parse('https://my-json-server.typicode.com/SharminSirajudeen/test_resources/users')))
          .thenAnswer((_) async =>
              http.Response('[{"albumId": 1,"userId": 1,"name": "User 1","url": "https://via.placeholder.com/600/92c952","thumbnailUrl": "https://via.placeholder.com/150/92c952"}]', 200));

      expect(await UserService().getUserList(), isA<List<User?>?>());
    });

    
  });
}