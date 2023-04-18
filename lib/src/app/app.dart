import '../repositories/repository_changeable.dart';

class BUI {

  // static final BUI instance = BUI._internal();
  static final BUI changeable = BUI._internal();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory BUI._changeable() {
    return changeable;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  BUI._internal() {
    // initialization logic
  }

  // rest of class as normal, for example:
  void openFile() {}
  void writeFile() {}

  /// this class will be updated
  init() {}

  late RepositoryChangeable repositoryChangeable;

}


/// 0. get init data like:
///   - username
///   - project
///   - project access token
///   - disable updates
/// 1. request and get some changeableWidgets
/// 2. notify when receiving data
/// 3. update widget in changeable widgets