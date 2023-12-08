import 'package:task_management/domains/models/user.dart';

final List<User> mockUsers = [
  User(
    id: 'uid001',
    name: 'Frogman',
    avatar: 'https://xsgames.co/randomusers/assets/avatars/male/10.jpg',
  ),
  User(
    id: 'uid002',
    name: 'Schiller',
    avatar: 'https://xsgames.co/randomusers/assets/avatars/male/20.jpg',
  ),
  User(
    id: 'uid003',
    name: 'Hyaline',
    avatar: 'https://xsgames.co/randomusers/assets/avatars/female/30.jpg',
  ),
  User(
    id: 'uid004',
    name: 'Sully',
    avatar: 'https://xsgames.co/randomusers/assets/avatars/female/40.jpg',
  ),
  User(
    id: 'uid005',
    name: 'Kazoo',
    avatar: 'https://xsgames.co/randomusers/assets/avatars/male/50.jpg',
  ),
];

abstract class UserDataSource {
  List<User> getUsers();
}

class UserDataSourceImpl extends UserDataSource {
  @override
  List<User> getUsers() => List.from(mockUsers);
}
