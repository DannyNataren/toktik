

import 'package:flutter/widgets.dart';
import 'package:toktik_clean/user/domain/entities/user_entity.dart';
import 'package:toktik_clean/user/domain/useCases/user_usecases.dart';

class DiscoverUserProvider extends ChangeNotifier {
  final UserUseCases userUseCases;
  User? user;
  DiscoverUserProvider({required this.userUseCases});
  Future<void> login(String username, String password) async {
    final userR = await userUseCases.login(username, password);
    user = userR;
    notifyListeners();
  }
}