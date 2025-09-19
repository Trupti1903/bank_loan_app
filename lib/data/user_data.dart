import '../models/user.dart';

class UserData {
  static User? currentUser;

  static void setUser(User user) {
    currentUser = user;
  }

  static User? getUser() {
    return currentUser;
  }

  static void clearUser() {
    currentUser = null;
  }
}
