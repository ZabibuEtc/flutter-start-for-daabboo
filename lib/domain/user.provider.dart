import 'package:flutter_app_architecture/data/dao/user.dao.dart';
import 'package:flutter_app_architecture/data/services/user.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDaoProvider = Provider((ref) => UserDao());

final userServiceProvider =
    Provider<UserService>((ref) => UserService(ref.watch(userDaoProvider)));
