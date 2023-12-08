import 'package:get_it/get_it.dart';
import 'package:task_management/domains/data_sources/user_data_source.dart';
import 'package:task_management/domains/models/user.dart';

abstract class UserRepository {
  Future<List<User>> fetchUsers();
}

class UserRepositoryImpl extends UserRepository {
  UserDataSource userDataSource = GetIt.instance<UserDataSource>();

  @override
  Future<List<User>> fetchUsers() async {
    return userDataSource.getUsers();
  }
}
