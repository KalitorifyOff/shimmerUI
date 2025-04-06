import 'package:shimmerpoc/domain/entity/friends_entity.dart';

class Friends extends FriendsEntity {
  Friends({
    required super.name,
    required super.profilePath,
    required super.isVerified,
    required super.lastSeen,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'profilePath': profilePath,
      'isVerified': isVerified,
      'lastSeen': lastSeen,
    };
  }

  factory Friends.fromMap(Map<String, dynamic> map) {
    return Friends(
      name: map['name'] != null ? map['name'] as String : null,
      profilePath:
          map['profilePath'] != null ? map['profilePath'] as String : null,
      isVerified: map['isVerified'] != null ? map['isVerified'] as bool : false,
      lastSeen: map['lastSeen'] != null ? map['lastSeen'] as String : null,
    );
  }
}
