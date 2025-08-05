import 'package:fundraising/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password); // Contract
}
