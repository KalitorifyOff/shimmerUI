class UserProvider {
  static Future<dynamic> getUser() async {
    await Future.delayed(const Duration(seconds: 2));
    return {
      'loggedUserName': 'Brinda',
      'friends': [
        {
          'name': 'Renga',
          'profilePath': 'assets/images/profilePic1.jpeg',
          'isVerified': true,
          'lastSeen': '2 min ago',
        },
        {
          'name': 'Abhishek',
          'profilePath': 'assets/images/profilePic2.jpg',
          'isVerified': false,
          'lastSeen': '1 day ago',
        },
        {
          'name': 'Monika',
          'profilePath': 'assets/images/profilePic3.jpg',
          'isVerified': true,
          'lastSeen': '2 hours ago',
        },
        {
          'name': 'Suguna',
          'profilePath': 'assets/images/profilePic4.jpeg',
          'isVerified': false,
          'lastSeen': '2 day ago',
        },
        {
          'name': 'Emiri',
          'profilePath': 'assets/images/profilePic5.jpg',
          'isVerified': true,
          'lastSeen': '8 min ago',
        },
        {
          'name': 'Kayadu',
          'profilePath': 'assets/images/profilePic6.jpg',
          'isVerified': false,
          'lastSeen': '1 day ago',
        },
        {
          'name': 'Katie',
          'profilePath': 'assets/images/profilePic7.jpg',
          'isVerified': false,
          'lastSeen': '9 day ago',
        },
      ],
      'posts': [
        {
          'postPath': 'assets/images/model1.jpeg',
          'isTrending': true,
          'user': {
            'name': 'Katie',
            'profilePath': 'assets/images/profilePic7.jpg',
          },
        },
        {
          'postPath': 'assets/images/model2.jpeg',
          'isTrending': false,
          'user': {
            'name': 'Kayadu',
            'profilePath': 'assets/images/profilePic6.jpg',
          },
        },
        {
          'postPath': 'assets/images/model3.jpeg',
          'isTrending': true,
          'user': {
            'name': 'Monika',
            'profilePath': 'assets/images/profilePic5.jpg',
          },
        },
        {
          'postPath': 'assets/images/model4.jpeg',
          'isTrending': false,
          'user': {
            'name': 'Emiri',
            'profilePath': 'assets/images/profilePic4.jpeg',
          },
        },
        {
          'postPath': 'assets/images/model5.jpeg',
          'isTrending': true,
          'user': {
            'name': 'Suguna',
            'profilePath': 'assets/images/profilePic3.jpg',
          },
        },
        {
          'postPath': 'assets/images/model6.jpeg',
          'isTrending': false,
          'user': {
            'name': 'Abishek',
            'profilePath': 'assets/images/profilePic2.jpg',
          },
        },
        {
          'postPath': 'assets/images/model7.jpeg',
          'isTrending': false,
          'user': {
            'name': 'Renga',
            'profilePath': 'assets/images/profilePic1.jpeg',
          },
        },
      ],
    };
  }
}
