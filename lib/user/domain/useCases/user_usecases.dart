import 'package:toktik_clean/user/domain/entities/user_entity.dart';
import 'package:toktik_clean/user/domain/repositories/user_repository.dart';

class UserUseCases {
  final UserRepository _userRepository;
  UserUseCases(this._userRepository);
  Future<List<User>> getUsers(){
    return _userRepository.getUsers();
  }
  Future<User> getById(int id){
    return _userRepository.getById(id);
  }
  Future<User> create(User user){
    return _userRepository.create(user);
  }
  Future<String> delete(int userId){
    return _userRepository.delete(userId);
  }
  Future<User> login(String userName, String password){
    return _userRepository.login(userName, password);
  }
}