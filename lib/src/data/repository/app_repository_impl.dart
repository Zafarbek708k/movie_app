import "app_repository.dart";


class AppRepositoryImpl implements AppRepository {
  factory AppRepositoryImpl() => _impl;
  const AppRepositoryImpl._internal();
  static const AppRepositoryImpl _impl = AppRepositoryImpl._internal();


}
