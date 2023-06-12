import 'package:toktik_clean/user/data/datasource/user_datasource.dart';
import 'package:toktik_clean/user/domain/entities/user_entity.dart';
import 'package:toktik_clean/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  final UserDataSource userDataSource;
  UserRepositoryImpl({required this.userDataSource});
  @override
  Future<User> create(User user) async{
    return await userDataSource.createContent(user);
  }

  @override
  Future<String> delete(int userId) async{
    return await userDataSource.deleteContent(userId);
  }

  @override
  Future<User> getById(int userId) async{
    return await userDataSource.getById(userId);
  }

  @override
  Future<List<User>> getUsers() async{
    return userDataSource.getUsers();
  }

  @override
  Future<User> login(String userName, String password) {
    return userDataSource.login(userName, password);
  }

}