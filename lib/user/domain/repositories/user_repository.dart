
import 'package:toktik_clean/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
  Future<User> getById(int userId);
  Future<User> create(User user);
  Future<String> delete(int userId);
  Future<User> login(String userName, String password);
}