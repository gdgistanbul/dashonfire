
import 'package:dash_on_fire/services/auth_service.dart';
import 'package:dash_on_fire/services/firestore_service.dart';
import 'package:dash_on_fire/viewmodels/login_provider.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Auth());
  locator.registerLazySingleton(() => DataBase());
  locator.registerLazySingleton(() => LoginProvider());
}