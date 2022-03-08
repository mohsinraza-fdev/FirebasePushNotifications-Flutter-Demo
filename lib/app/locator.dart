import 'package:fastfood_menu_app/services/app_firestore_service.dart';
import 'package:fastfood_menu_app/services/app_push_notification_service.dart';
import 'package:fastfood_menu_app/services/deal_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AppFirestoreService());
  locator.registerLazySingleton(() => DealService());
  locator.registerLazySingleton(() => AppPushNotificationService());
}
