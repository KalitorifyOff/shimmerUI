import 'package:shimmerpoc/data/model/user_model.dart';

abstract class IUserRepo {
  Future<UserModel> getUser();
}
