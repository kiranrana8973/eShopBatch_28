import 'package:eshopping/api/user_api.dart';

import '../model/user.dart';

class UserRepository {
  registerUser(User user) async {
    return await UserAPI().registerUser(user);
  }
}
