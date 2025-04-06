import 'package:shimmerpoc/data/model/friends_model.dart';
import 'package:shimmerpoc/data/model/user_model.dart';
import 'package:shimmerpoc/domain/entity/post_entity.dart';

class Posts extends PostsEntity {
  Posts({
    required super.postPath,
    required super.isTrending,
    required super.user,
  });

  factory Posts.fromMap(Map<String, dynamic> map) {
    return Posts(
      postPath: map['postPath'] != null ? map['postPath'] as String : null,
      isTrending: map['isTrending'] != null ? map['isTrending'] as bool : false,
      user: map['user'] != null ? Friends.fromMap(map['user']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postPath': postPath,
      'isTrending': isTrending,
      'user': (user as UserModel).toMap(),
    };
  }
}
