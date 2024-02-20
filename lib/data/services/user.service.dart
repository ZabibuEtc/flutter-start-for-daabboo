// lib/data/services/user_service.dart

import 'package:flutter_app_architecture/data/dao/user.dao.dart';

import '../models/user.model.dart';

class UserService {
  final UserDao _userDao;

  UserService(this._userDao);

  Future<List<User>> getAllUsers() async {
    return await _userDao.getAllUsers();
  }

  Future<User?> getUserById(int id) async {
    return await _userDao.getUserById(id);
  }

  Future<void> createUser(User user) async {
    // Ajouter des règles métier avant la création (ex: validation)
    await _userDao.createUser(user);
  }

  Future<void> updateUser(User user) async {
    // Appliquer des règles métier avant la mise à jour
    await _userDao.updateUser(user);
  }

  Future<void> deleteUser(int id) async {
    // Gérer la logique de suppression (ex: notifications)
    await _userDao.deleteUser(id);
  }
}
