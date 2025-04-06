import 'package:shimmerpoc/data/model/friends_model.dart';
import 'package:shimmerpoc/data/model/post_model.dart';
import 'package:shimmerpoc/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.loggedUserName,
    required super.friends,
    required super.posts,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      loggedUserName:
          map['loggedUserName'] != null
              ? map['loggedUserName'] as String
              : null,
      friends:
          map['friends'] != null
              ? (map['friends'] as List<dynamic>)
                  .map((friend) => Friends.fromMap(friend))
                  .toList()
              : [],
      posts:
          map['posts'] != null
              ? (map['posts'] as List<dynamic>)
                  .map((post) => Posts.fromMap(post))
                  .toList()
              : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'loggedUserName': loggedUserName,
      'friends': friends?.map((friend) => (friend as Friends).toMap()).toList(),
      'posts': posts?.map((post) => (post as Posts).toMap()).toList(),
    };
  }
}
