class UserStateManager {
  String? userId;
  static final UserStateManager _instance = UserStateManager._internal();

  factory UserStateManager() {
    return _instance;
  }

  UserStateManager._internal();
}
