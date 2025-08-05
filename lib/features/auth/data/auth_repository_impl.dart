import 'package:fundraising/features/auth/domain/entities/user_entity.dart';
import 'package:fundraising/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<User> login(String email, String password) {
    return Future.delayed(
        Duration(seconds: 1), () => User(id: 'dummy_123', name: 'Test User'));
  }
}
