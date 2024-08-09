import '../../domain/entities/users.dart';
import '../../domain/repositories/userrepository.dart';
import '../datasources/local/LocalDataSource.dart';



class UserRepositoryImpl implements UserRepository {
  final LocalDataSource _localDataSource;

  UserRepositoryImpl(this._localDataSource);

  @override
  Future<User?> signIn(String email, String password) async {
    // Implement sign-in logic here, using the mock API
    // and storing the user data in local storage
    final user = User(
      id: 1,
      name: 'John Doe',
      email: email,
    );
    await _localDataSource.saveUser(user);
    return user;
  }

  @override
  Future<User?> signUp(String name, String email, String password) async {
    // Implement sign-up logic here, using the mock API
    // and storing the user data in local storage
    final user = User(
      id: 2,
      name: name,
      email: email,
    );
    await _localDataSource.saveUser(user);
    return user;
  }

  @override
  Future<User?> getLoggedInUser() async {
    return await _localDataSource.getUser();
  }

  @override
  Future<void> signOut() async {
    await _localDataSource.clearUserData();
  }
}