import 'package:shimmerpoc/domain/entity/friends_entity.dart';
import 'package:shimmerpoc/domain/entity/post_entity.dart';

class UserEntity {
  String? loggedUserName;
  List<FriendsEntity>? friends;
  List<PostsEntity>? posts;

  UserEntity({
    required this.loggedUserName,
    required this.friends,
    required this.posts,
  });
}
