import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await setUpConfigMobile();
  await setUpLocalDatabase();
  await setUpDataBaseRepositories();
  await setUpDataBaseServices();
  await setUpNetworkRepositories();
  await setUpNetworkServices();
}

Future<void> setUpConfigMobile() async {}

Future<void> setUpLocalDatabase() async {}

Future<void> setUpDataBaseRepositories() async {}

Future<void> setUpDataBaseServices() async {}

Future<void> setUpNetworkRepositories() async {}

Future<void> setUpNetworkServices() async {}
