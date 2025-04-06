import 'package:shimmerpoc/data/model/user_model.dart';
import 'package:shimmerpoc/data/provider/user_provider.dart';
import 'package:shimmerpoc/domain/repo/user_repo.dart';

class UserRepo implements IUserRepo {
  @override
  Future<UserModel> getUser() async {
    await Future.delayed(Duration(seconds: 2));
    var res = await UserProvider.getUser();
    return UserModel.fromMap(res);
  }
}
