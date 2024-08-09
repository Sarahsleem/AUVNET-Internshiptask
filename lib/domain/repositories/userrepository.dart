
import '../entities/users.dart';

abstract class UserRepository {
  Future<User?> signIn(String email, String password);
  Future<User?> signUp(String name, String email, String password);
  Future<User?> getLoggedInUser();
  Future<void> signOut();
}