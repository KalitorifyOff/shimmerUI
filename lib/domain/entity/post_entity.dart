import 'package:shimmerpoc/domain/entity/friends_entity.dart';

class PostsEntity {
  String? postPath;
  bool? isTrending;
  FriendsEntity? user;
  PostsEntity({
    required this.postPath,
    required this.isTrending,
    required this.user,
  });
}
